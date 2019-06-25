# abort if no changes to commit
If (-Not (git status --porcelain)) {
	"No changes to commit. Aborted!"
	exit
}

"Generating site"
# hugo --quiet
hugo -t casper

"Committing master branch to hugo-blog"
git add --all
git commit -m "push to gh"

"Committing content branch to hongyu89.github.io"
Push-Location -path public
git add --all
git commit -m "push to hongyu89.github.io"

"Pushing gh-pages branch to Github"
git push origin master


# pop back to Hugo folder
Pop-Location

"Pushing master to Github"
git push 
