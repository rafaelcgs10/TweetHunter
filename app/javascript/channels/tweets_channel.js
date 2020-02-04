import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    if(this.subscription) {
	consumer.subscriptions.remove(this.subscription);
    }

    if($('#hashtag').attr('data-hashtag-id')) {
	const subscription = consumer.subscriptions.create({channel: "TweetsChannel", id:$('#hashtag').attr('data-hashtag-id')}, {
	    connected() {
	    },

	    disconnected() {
	    },

	    received(data) {
		$('#tweets-card').prepend( data.content)
	    }
	});
	this.subscription = subscription;
    }
})

