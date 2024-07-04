function one {
    rm -rf repo
    mkdir repo
    (cd repo; git init; git config user.name "nobody"; git config user.email "nobody@gmail.com")
}

function two {
    echo -- create
    echo
    cp data.json repo/data.json
    (cd repo; git add .; git commit -m "create data.json")
    echo Create branches
    (cd repo; git checkout main; git checkout -b feature-1)
    (cd repo; git checkout main; git checkout -b feature-2)
}

function three {
    echo -- Make changes in feature-1
    echo

    (cd repo; git checkout feature-1)
    cp data.feature-1.json repo/data.json
    (cd repo; git add .; git commit -m "edit data.json 1"; git diff main)
    echo
    echo Merge feature-1 to main
    (cd repo; git checkout main; git merge --no-edit feature-1)
    (cd repo; git log --all --decorate --oneline --graph)
}

function four {
    echo -- Make changes in feature-2
    echo

    (cd repo; git checkout feature-2)
    cp data.feature-2.json repo/data.json
    (cd repo; git add .; git commit -m "edit data.json 2"; git diff main)
    echo
    echo Merge feature-2 to main
    (cd repo; git checkout main; git merge --no-edit feature-2)
    (cd repo; git log --all --decorate --oneline --graph)
}

function five {
    echo -- final data.json
    echo

    (cat repo/data.json)
}