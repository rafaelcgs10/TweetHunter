import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    consumer.subscriptions.create({channel: "TweetsChannel", id:$('#hashtag').attr('data-hashtag-id')}, {
	connected() {
	    // Called when the subscription is ready for use on the server
	    console.log("we are live on:" + $('#hashtag').attr('data-hashtag-id'))
	},

	disconnected() {
	    // Called when the subscription has been terminated by the server
	},

	received(data) {
	    // Called when there's incoming data on the websocket for this channel
	    console.log(data.content)
	}
    });
})
