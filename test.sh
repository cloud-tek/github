TAG="0.15.0-alpha.5"
if [[ $TAG =~ ^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-((0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))$ ]];
then
    git push --delete origin $TAG
    echo "$TAG is prelease. Deleted."
else
    echo "$TAG is not prelease. Skipped."
fi

if [[ $TAG == *"-"* ]]
then
    echo "$TAG might be a prelease."
fi