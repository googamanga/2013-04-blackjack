class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    console.log(array) 
  hit: ->
    @add(@deck.pop()).last()
    console.log(@checkScore())
    if @checkScore() then @bust()

  checkScore: ->
    @scores() > 21

  bust: ->
    Backbone.trigger('bust')
    console.log("bust")

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]


#identify the rules "both > 21 lose"
#player will win 21, unless dealer has 21
#find out if "you" win after getting 5 cards without going over 21

###USER :
user plays - if bust - lose.
hit()
continue if not.

-click hit or stand.

hit()
then check if bust.
if bust - dealer is winner.

stand()
compare dealer - return winner.
trigger event in hand - app is listening.
when app hears - trigger dealer(play)
###
