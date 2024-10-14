from funcs import *


# list of functions and their identifier names
funcs = [
    ['exit', ex],
    ['vim', vim],
    ['nvim', nvim],
    ['starship', starship],
    ['kitty', kitty],
    ['superfile', superfile],
    ['sway', sway],
    ['waybar', waybar],
    ['wofi', wofi],
    ['bash', bash],
    ['scripts', scripts],
]

all_funcs = []
for func in funcs[1:]:
    all_funcs.append(func[1])

# list of bundles
bundles = [
    [
        'exit',
        [
            ex,
        ]
    ],
    [
        'base',
        [
            vim,
            nvim,
            starship,
            kitty,
        ]
    ],
    [
        'sway',
        [
            sway,
            waybar_sway,
            wofi,
        ]
    ],
    [
        'all',
        all_funcs
    ],
]
