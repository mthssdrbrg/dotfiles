slate.configAll({
  'defaultToCurrentScreen' : true,
  'secondsBetweenRepeat' : 0.1,
  'checkDefaultsOnLoad' : true,
  'focusCheckWidthMax' : 3000,
  'orderScreensLeftToRight' : true
});

var hyper = function(key) {
  return key + ':' + 'ctrl;shift;alt;cmd';
};

var fullScreen = slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY'
});

var terminalFullScreen = slate.operation('move', {
  'x' : 'screenOriginX+6',
  'y' : 'screenOriginY+4',
  'width' : 'screenSizeX-6',
  'height' : 'screenSizeY-4'
});

slate.bind('f:cmd;alt', function(win) {
  var appName = win.app().name();

  if (appName == 'iTerm' || appName == 'MacVim') {
    win.doOperation(terminalFullScreen);
  } else {
    win.doOperation(fullScreen);
  }
});

slate.bind('left:cmd;alt', slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/2',
  'height' : 'screenSizeY'
}));
slate.bind('right:cmd;alt', slate.operation('move', {
  'x' : 'screenOriginX+screenSizeX/2',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/2',
  'height' : 'screenSizeY'
}));
slate.bind('up:cmd;alt', slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY/2'
}));
slate.bind('down:cmd;alt', slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY+(screenSizeY/2)',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY/2'
}));

slate.bind('left:cmd;alt;shift', slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/3',
  'height' : 'screenSizeY'
}));
slate.bind('right:cmd;alt;shift', slate.operation('move', {
  'x' : 'screenOriginX+screenSizeX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/3',
  'height' : 'screenSizeY'
}));

slate.bind('right:ctrl;alt', slate.operation('nudge', { 'x' : '+5%', 'y' : '+0'  }));
slate.bind('left:ctrl;alt',  slate.operation('nudge', { 'x' : '-5%', 'y' : '+0'  }));
slate.bind('up:ctrl;alt',    slate.operation('nudge', { 'x' : '+0',  'y' : '-5%' }));
slate.bind('down:ctrl;alt',  slate.operation('nudge', { 'x' : '+0',  'y' : '+5%' }));

slate.bind('right:ctrl;alt;cmd', slate.operation('push', { 'direction' : 'right' }));
slate.bind('left:ctrl;alt;cmd',  slate.operation('push', { 'direction' : 'left'  }));

slate.bind(hyper('i'), slate.operation('focus', { 'app' : 'iTerm'         }));
slate.bind(hyper('c'), slate.operation('focus', { 'app' : 'Google Chrome' }));
slate.bind(hyper('m'), slate.operation('focus', { 'app' : 'MacVim'        }));
slate.bind(hyper('e'), slate.operation('focus', { 'app' : 'Evernote'      }));
slate.bind(hyper('s'), slate.operation('focus', { 'app' : 'Spotify'       }));
slate.bind(hyper('t'), slate.operation('focus', { 'app' : 'Twitter'       }));
slate.bind(hyper('x'), slate.operation('focus', { 'app' : 'GitX'          }));
slate.bind(hyper('p'), slate.operation('focus', { 'app' : 'Propane'       }));
slate.bind(hyper('g'), slate.operation('focus', { 'app' : 'Burtcorp Mail' }));

slate.bind(hyper('up'),    slate.operation('resize', { 'width' : '+0', 'height'  : '-5%' }));
slate.bind(hyper('down'),  slate.operation('resize', { 'width' : '+0', 'height'  : '+5%' }));
slate.bind(hyper('left'),  slate.operation('resize', { 'width' : '-5%', 'height' : '+0'  }));
slate.bind(hyper('right'), slate.operation('resize', { 'width' : '+5%', 'height' : '+0'  }));

slate.bind('l:cmd;shift', slate.operation('focus', { 'direction' : 'right' }));
slate.bind('h:cmd;shift', slate.operation('focus', { 'direction' : 'left'  }));
slate.bind('k:cmd;shift', slate.operation('focus', { 'direction' : 'up'    }));
slate.bind('j:cmd;shift', slate.operation('focus', { 'direction' : 'down'  }));

slate.bind(hyper('r'), slate.operation('relaunch'));
slate.bind(hyper('f'), slate.operation('hint', { 'characters' : 'ASDFGHJKL' }));
slate.bind('g:cmd;alt', slate.operation('grid'));
slate.bind('z:cmd;alt', slate.operation('undo'));