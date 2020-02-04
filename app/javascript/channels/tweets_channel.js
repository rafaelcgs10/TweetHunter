import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    if(this.subscription) {
	consumer.subscriptions.remove(this.subscription);
	console.log("unsubing");
    }

    if($('#hashtag').attr('data-hashtag-id')) {
	const subscription = consumer.subscriptions.create({channel: "TweetsChannel", id:$('#hashtag').attr('data-hashtag-id')}, {
	    connected() {
		console.log("we are live on: " + $('#hashtag').attr('data-hashtag-id'));
	    },

	    disconnected() {
		console.log("disconecting")
	    },

	    received(data) {
		$('#tweets-card').prepend( data.content)
	    }
	});
	this.subscription = subscription;
    }
})

