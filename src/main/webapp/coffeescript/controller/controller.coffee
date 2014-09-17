define ['angular', 'css!style/app/signin'], ->
  'use strict'
  angular.module('controller', [])

  #AppCtrl is base controller
  .controller 'AppCtrl', ($scope, Message, Alert, BreadcrumbSrv, UserSrv)->
#    $scope.message = Message
    $scope.currentUser = UserSrv.currentUser
    $scope.breadcrumb = BreadcrumbSrv
    $scope.signout = (outpath) ->
      UserSrv.signout(outpath)

#    if !$.support.leadingWhitespace
#      Alert.addAlert({type: 'danger', msg: '不支持该浏览器，推荐使用最新版本以获得更好的体验!', keep: true})

  #HeaderCtrl is Navbar
  .controller 'HeaderCtrl', ($scope, $log, $modal, AppSrv, UserSrv) ->
    $scope.menus = [
      {icon: 'user', name: 'Center', url: '/center', children: [{icon: 'user', name: 'Center1', url: '/center'}
                                                                  {icon: 'info', name: 'About1', url: '/about'}]}
      {icon: 'calendar', name: 'Calendar', url: '/calendar'}
      {icon: 'info', name: 'About', url: '/about'}
    ]

    #    console.log $scope.menus[0].children.length
    if UserSrv.isAuthed
      $scope.menus = UserSrv.user.menus || $scope.menus

    $scope.searchAll = (content)->
      if content && $.trim(content) != ''
        AppSrv.searchAll(content)


  #FooterCtrl is Version
  .controller 'FooterCtrl', ($scope) ->
    $scope.foot = 'foot'

  #HomeCtrl is first page
  .controller 'HomeCtrl', ($scope, User) ->
    $scope.name = 'baby'

    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS!!!',
      'RequireJS',
      'Foundation',
      'Karma',
      'haha']

  #SignupCtrl is sign up page
#  .controller 'SignupCtrl', ($scope, Email) ->
#    $scope.user =
#      username: "example@hello.com"
#      password: "123456"
#
#    $scope.create = (user, captcha) ->
#      $scope.email = new Email()
#      $scope.email.user = user
#      $scope.email.captcha = captcha
#
#      console.log $scope.email


  #SigninCtrl is sign in page
  .controller 'SigninCtrl', ($scope, UserSrv) ->
    $scope.signin = (user, captcha) ->
      UserSrv.signin(user, captcha)
  #About me
  .controller 'AboutCtrl', ($scope)->
    $scope.organize = 'Icedog'