#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: =>#which of these is sending the command (dealer)
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'playerScore', null
    @set 'playerWins', 0
    @set 'dealerHand', deck.dealDealer()
    @set 'dealerScore', null
    @set 'dealerWins', 0
    @get('playerHand').on("stand bust", @dealerLogic)
    @get('dealerHand').on("stand bust", @checkWhoWins)
    @set 'variable', 'hello'

  dealerLogic: =>
    console.log('dealerLogic')
    @get('dealerHand').at(0).flip()
    @dealerScore = @get('dealerHand').scores()
    @playerScore = @get('playerHand').scores()
    console.log("dealer score:", @dealerScore, "player score:", @playerScore)
    if @dealerScore >= @playerScore then @get('dealerHand').stand()

  checkWhoWins: =>
    console.log('checking who won')
    if @dealerScore >= @playerScore and @dealerScore <= 21 then @set('dealerWins', @get('dealerWins')+1)
    if @dealerScore < @playerScore and @playerScore <= 21 then @set('playerWins', @get('playerWins')+1)
    console.log("dealerWins: ", @get('dealerWins'), ", playerWins:", @get('playerWins'))
  #   @redeal()

  # redeal: =>
  #   console.log('redeal')
  #   @set 'deck', deck = new Deck()
  #   @set 'playerHand', deck.dealPlayer()
  #   console.log('player hand:', @get('playerHand'))
  #   @set 'dealerHand', deck.dealDealer()


