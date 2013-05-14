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
    @get('dealerHand').on("hit", @dealerLogic)
    @get('dealerHand').on("stand bust", @checkWhoWins)
    @set 'variable', 'hello'

  dealerLogic: =>
    console.log('dealerLogic')
    if @get('dealerHand').at(0).get('revealed') == false then @get('dealerHand').at(0).flip()
    @dealerScore = @get('dealerHand').scores()
    @playerScore = @get('playerHand').scores()
    console.log("dealer score:", @dealerScore, "player score:", @playerScore)
    if @dealerScore < 17
      console.log('dealer hits')
      @get('dealerHand').hit()
    else if @dealerScore <= 21
      console.log 'dealer stands'
      @get('dealerHand').stand()


  checkWhoWins: =>
    console.log('checking who won')
    if @dealerScore <= 21 and @playerScore > 21
      console.log(1)
      @dealerWins()
    else if @playerScore <= 21 and @dealerScore > 21
      console.log(2)
      @playerWins()
    else if @dealerScore >= @playerSocre
      console.log(3)
      @dealerWins()
    else
      console.log(4)
      @playerWins()

  dealerWins: =>
    @set('dealerWins', @get('dealerWins')+1)
    console.log 'Dealer wins!'
    console.log("dealerWins: ", @get('dealerWins'), ", playerWins:", @get('playerWins'))
    # @redeal()

  playerWins: =>
    @set('playerWins', @get('playerWins')+1)
    console.log 'Player wins!'
    console.log("dealerWins: ", @get('dealerWins'), ", playerWins:", @get('playerWins'))
    # @redeal()

  # redeal: =>
  #   console.log('redeal')
  #   @set 'deck', deck = new Deck()
  #   @set 'playerHand', deck.dealPlayer()
  #   console.log('player hand:', @get('playerHand'))
  #   console.log('dealer hand:', @get('dealerHand'))
  #   @set 'dealerHand', deck.dealDealer()


