#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: =>#which of these is sending the command (dealer)
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on("stand", @dealerPlays)

  dealerPlays: =>
    console.log('dealerPlays')
    @get('dealerHand').at(0).flip();
    if @get('dealerHand').scores()[0] >= @get('playerHand').scores()[0] then console.log("winner")
