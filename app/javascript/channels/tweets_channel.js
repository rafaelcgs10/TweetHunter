import consumer from './consumer'
var subscription = null
var pageNum = null
var hashtagDivId = null
var params = null

$(document).on('turbolinks:load', function () {
  params = new window.URLSearchParams(window.location.search)
  if (subscription) {
    consumer.subscriptions.remove(subscription)
    subscription = null
  }
  pageNum = params.get('page')
  hashtagDivId = document.getElementById('hashtag')
  if (hashtagDivId && (pageNum === '1' || pageNum === null)) {
    var hashtagId = hashtagDivId.getAttribute('data-hashtag-id')
    subscription = consumer
      .subscriptions
      .create({ channel: 'TweetsChannel', id: hashtagId }, {
        connected () {
        },

        disconnected () {
        },

        received (data) {
          $('#tweets-card').prepend(data.content)
        }
      })
  }
})
