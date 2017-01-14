Hints.characters = 'asdfghjkl';
settings.tabsMRUOrder = false;
settings.tabsThreshold = 18;
settings.hintAlign = "left";

unmap('w');
unmap('ab');
map('H', 'S');
map('L', 'D');
map('J', 'E');
map('K', 'R');
map('b', 'T');
map('u', 'e');
map('F', 'gf');

settings.theme = '\
.sk_theme { \
    background: #fff; \
    color: #000; \
} \
.sk_theme tbody { \
    color: #000; \
} \
.sk_theme input { \
    color: #000; \
} \
.sk_theme .url { \
    color: #555; \
} \
.sk_theme .annotation { \
    color: #555; \
} \
.sk_theme .focused { \
    background: #f0f0f0; \
}';
