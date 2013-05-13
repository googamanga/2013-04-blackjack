#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: =>#which of these is sending the command (dealer)
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()





#identify the rules "both > 21 lose"
#player will win 21, unless dealer has 21
#find out if "you" win after getting 5 cards without going over 21
