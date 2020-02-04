import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    if($('#hashtag').attr('data-hashtag-id')) {

	consumer.subscriptions.create({channel: "TweetsChannel", id:$('#hashtag').attr('data-hashtag-id')}, {
	    connected() {
		console.log("we are live on: " + $('#hashtag').attr('data-hashtag-id'));
	    },

	    disconnected() {
		console.log("disconecting")
	    },

	    received(data) {
		$('#tweets-card').prepend( data.content)
	    }
	})
    }
})

