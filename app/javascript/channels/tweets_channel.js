import consumer from './consumer';

let subscription = null;
let pageNum = null;
let hashtagDivId = null;
let params = null;

$(document).on('turbolinks:load', () => {
  params = new window.URLSearchParams(window.location.search);
  if (subscription) {
    consumer.subscriptions.remove(subscription);
    subscription = null;
  }
  pageNum = params.get('page');
  hashtagDivId = document.getElementById('hashtag');
  if (hashtagDivId && (pageNum === '1' || pageNum === null)) {
    const hashtagId = hashtagDivId.getAttribute('data-hashtag-id');
    subscription = consumer
      .subscriptions
      .create({ channel: 'TweetsChannel', id: hashtagId }, {
        connected() {
        },

        disconnected() {
        },

        received(data) {
          $('#tweets-card').prepend(data.content);
        },
      });
  }
});
