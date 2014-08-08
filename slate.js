S.configAll({
  'defaultToCurrentScreen' : true,
  'secondsBetweenRepeat' : 0.1,
  'checkDefaultsOnLoad' : true,
  'focusCheckWidthMax' : 3000,
  'orderScreensLeftToRight' : true
});

var hyper = function(key) {
  return key + ':' + 'ctrl;shift;alt;cmd';
};

var fullScreen = S.op('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY'
});

var terminalFullScreen = S.op('move', {
  'x' : 'screenOriginX+6',
  'y' : 'screenOriginY+4',
  'width' : 'screenSizeX-6',
  'height' : 'screenSizeY-4'
});

var launchOrFocus = function (app) {
  return function (win) {
    var running = false;
    var focus = S.op('focus', {'app' : app});
    var launch = S.op('shell', {
      'command' : '/Users/dist/bin/launch ' + app,
      'wait' : true
    });
    S.eachApp(function (a) {
      if (a.name() == app) {
        running = true;
      }
    });
    if (!running) {
      launch.run();
    }
    focus.run();
  }
};

S.bind('f:cmd;alt', function(win) {
  var appName = win.app().name();

  if (appName == 'iTerm' || appName == 'MacVim') {
    win.doOperation(terminalFullScreen);
  } else {
    win.doOperation(fullScreen);
  }
});

S.bind('left:cmd;alt', S.op('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/2',
  'height' : 'screenSizeY'
}));
S.bind('right:cmd;alt', S.op('move', {
  'x' : 'screenOriginX+screenSizeX/2',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/2',
  'height' : 'screenSizeY'
}));
S.bind('up:cmd;alt', S.op('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY/2'
}));
S.bind('down:cmd;alt', S.op('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY+(screenSizeY/2)',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY/2'
}));

S.bind('left:cmd;alt;shift', S.op('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/3',
  'height' : 'screenSizeY'
}));
S.bind('right:cmd;alt;shift', S.op('move', {
  'x' : 'screenOriginX+screenSizeX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/3',
  'height' : 'screenSizeY'
}));

S.bind('right:ctrl;alt', S.op('nudge', { 'x' : '+5%', 'y' : '+0'  }));
S.bind('left:ctrl;alt',  S.op('nudge', { 'x' : '-5%', 'y' : '+0'  }));
S.bind('up:ctrl;alt',    S.op('nudge', { 'x' : '+0',  'y' : '-5%' }));
S.bind('down:ctrl;alt',  S.op('nudge', { 'x' : '+0',  'y' : '+5%' }));

S.bind('right:ctrl;alt;cmd', S.op('push', { 'direction' : 'right' }));
S.bind('left:ctrl;alt;cmd',  S.op('push', { 'direction' : 'left'  }));

S.bind(hyper('i'), launchOrFocus('iTerm'));
S.bind(hyper('c'), launchOrFocus('Google Chrome'));
S.bind(hyper('e'), launchOrFocus('Evernote'));
S.bind(hyper('s'), launchOrFocus('Spotify'));
S.bind(hyper('t'), launchOrFocus('Twitter'));
S.bind(hyper('g'), launchOrFocus('Burtcorp Mail'));
S.bind(hyper('w'), launchOrFocus('Wunderlist'));

S.bind(hyper('p'), S.op('focus', { 'app' : 'Propane' }));
S.bind(hyper('x'), S.op('focus', { 'app' : 'GitX' }));
S.bind(hyper('m'), S.op('focus', { 'app' : 'MacVim' }));

S.bind(hyper('up'),    S.op('resize', { 'width' : '+0', 'height'  : '-5%' }));
S.bind(hyper('down'),  S.op('resize', { 'width' : '+0', 'height'  : '+5%' }));
S.bind(hyper('left'),  S.op('resize', { 'width' : '-5%', 'height' : '+0'  }));
S.bind(hyper('right'), S.op('resize', { 'width' : '+5%', 'height' : '+0'  }));

S.bind('l:cmd;shift', S.op('focus', { 'direction' : 'right' }));
S.bind('h:cmd;shift', S.op('focus', { 'direction' : 'left'  }));
S.bind('k:cmd;shift', S.op('focus', { 'direction' : 'up'    }));
S.bind('j:cmd;shift', S.op('focus', { 'direction' : 'down'  }));

S.bind(hyper('r'), S.op('relaunch'));
S.bind(hyper('f'), S.op('hint', { 'characters' : 'ASDFGHJKL' }));
S.bind('g:cmd;alt', S.op('grid'));
S.bind('z:cmd;alt', S.op('undo'));