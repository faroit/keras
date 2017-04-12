for tag in $(git for-each-ref --format='%(refname)' refs/tags/); do
  rm -rf sources
  git checkout "$tag"
  THEANO_FLAGS=device='cpu' python autogen.py
  mkdocs build
  mv site ${tag##*/}
done
