import consumer from "./consumer"


$(document).on('turbolinks:load', function () {
    const params = new window.URLSearchParams(window.location.search);
    if(this.subscription) {
	consumer.subscriptions.remove(this.subscription);
    }

    if($('#hashtag').attr('data-hashtag-id') && (params.get('page') == 1 || params.get('page') == null)) {
	const subscription = consumer.subscriptions.create({channel: "TweetsChannel", id:$('#hashtag').attr('data-hashtag-id')}, {
	    connected() {
	    },

	    disconnected() {
	    },

	    received(data) {
		$('#tweets-card').prepend(data.content)
	    }
	});
	this.subscription = subscription;
    }
})
