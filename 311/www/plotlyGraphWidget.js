var binding = new Shiny.OutputBinding();

binding.find = function(scope) {
    // not sure what this function does, or
    // why its necessary...
    console.log('binding.scope');
    return $(scope).find('#mychart');
};

binding.renderValue = function(el, messages) {
    // this gets called when the inputs change
    // messages is the list of named lists passed up
    // by renderGraph. these named lists are postMessage
    // commands that get passed into the embedded graph.
    // See https://github.com/plotly/Embed-API for details
    console.log('renderValue, messages: ', JSON.stringify(messages));
    var $el = $(el);

    if (!window.graphs) {
        console.log('first time rendering');
        initGraphs(messages);
    }

    parseAndRelayMessages(messages);
};

Shiny.outputBindings.register(binding, "plotlyshiny");

function initGraphs(initialMessages){
    var $graphs = $('.graphs');
    var graphs = {};
    $graphs.each(function(i){
        graphs[$graphs[i].id] = {
            graphContentWindow: $graphs[i].contentWindow,
            id: $graphs[i].id,
            pinger: setInterval(function(){
                $graphs[i].contentWindow.postMessage({task: 'ping'}, 'https://plot.ly');
            }, 500)
        };
    });


    // messages coming from the embedded graphs
    // either 'pong' or the 'hover', 'zoom', 'click' events
    window.addEventListener('message', function(e){
        var message = e.data;
        for(var graph_id in graphs){
            if(graphs[graph_id].graphContentWindow === e.source) {
                var graph = graphs[graph_id];
                break;
            }
        }

        var pinger = graph.pinger;
        var graphContentWindow = graph.graphContentWindow;
        var id = graph.id;

        if('pong' in message && message.pong) {
            console.log('>> clearing!');
            clearInterval(pinger);
            graphContentWindow.postMessage({
                'task': 'listen',
                'events': ['zoom', 'click', 'hover']},
            'https://plot.ly');
            parseAndRelayMessages(initialMessages);

            // TODO: send pong back to R
        } else if (message.type==='hover' ||
                    message.type==='zoom'  ||
                    message.type==='click') {
            console.log('>> ', message.type);
            if(message.type !== 'zoom') {
                for(var i in message.points) {
                    delete message.points[i].data;
                }
            }
            // TODO: Send back to R
        }
    });
    window.graphs = graphs;
}

function parseAndRelayMessages(messages) {
    messages.forEach(function(message){
        if(message.task==='custom'){
            // Normally, we'd just pass the intended object through to
            // the iframe, but in this case I couldn't figure out how to
            // get the R list serialized into the proper JSON format.
            // So, here I'm unpacking the message and constructing a custom
            // postMessage from that data. See plotlyGraphWidget.R
            var x = Object.keys(message.data);
            var y = [];
            for(var i=0; i<x.length; i++) {
                if(message.data[x[i]] !== 0){
                    y[i] = message.data[x[i]];
                }
            }

            message = {'id': message.id, 'task': 'restyle', 'update': {'x': [x], 'y': [y], 'type': 'bar'}};
            console.log(message);
        }

        window.graphs[message.id].graphContentWindow.postMessage(message, 'https://plot.ly');
    });

}
