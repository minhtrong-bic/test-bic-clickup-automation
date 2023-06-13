commit_message=$(git log --format=%B -n 1)
regex='([^[:space:]]+)\(([^)]+)\)'
if [[ $commit_message =~ $regex ]]; then
  commit_type="${BASH_REMATCH[1]}"
  change_scope="${BASH_REMATCH[2]}"
  echo $change_scope
  if [[ ! $change_scope =~ ^(major|minor|patch)$ ]]; then
    change_scope="patch"
  fi
else
  commit_type="chore"
  change_scope="patch"
fi

echo "::debug::Commit type: $commit_type. Change scope: $change_scope"
