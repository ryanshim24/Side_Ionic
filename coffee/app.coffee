app = angular.module("starter", ["ionic"]).run(($ionicPlatform) ->
  $ionicPlatform.ready ->
    cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
    StatusBar.styleDefault()  if window.StatusBar

).config(($stateProvider, $urlRouterProvider) ->
  $stateProvider.state("app",
    url: "/app"
    abstract: true
    templateUrl: "templates/menu.html"
    controller: "AppCtrl"
  ).state("app.search",
    url: "/search"
    views:
      menuContent:
        templateUrl: "templates/search.html"
  ).state("app.browse",
    url: "/browse"
    views:
      menuContent:
        templateUrl: "templates/browse.html"
        controller: "BrowseCtrl"
  ).state("app.playlists",
    url: "/playlists"
    views:
      menuContent:
        templateUrl: "templates/playlists.html"
        controller: "PlaylistsCtrl"
  ).state "app.single",
    url: "/playlists/:playlistId"
    views:
      menuContent:
        templateUrl: "templates/playlist.html"
        controller: "PlaylistCtrl"


  # if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise "/app/playlists"
)
