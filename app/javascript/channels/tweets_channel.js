import consumer from './consumer'
var subscription = null

$(document).on('turbolinks:load', function () {
  const params = new window.URLSearchParams(window.location.search)
  if (subscription) {
    console.log('unsub')
    consumer.subscriptions.remove(subscription)
  }
  const pageNum = params.get('page')
  const hashtagId = $('#hashtag').getAttribute('data-hashtag-id')
  if (hashtagId && (pageNum === 1 || pageNum === null)) {
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
