target_dir="$HOME/Library/Application Support/Sublime Text 3";
source_dir="$(cd "$(dirname "$0")" > /dev/null; pwd)";

target_keymap="$target_dir/Packages/User/Default (OSX).sublime-keymap";
target_pref="$target_dir/Packages/User/Preferences.sublime-settings";

rm "$target_keymap";
rm "$target_pref";
ln -s "$source_dir/keymap.json" "$target_keymap";
ln -s "$source_dir/settings.json" "$target_pref";

FILES="$source_dir/Packages/*";
for f in $FILES; do
	f=$(basename $f);
	rm -rf "$target_dir/Packages/User/$f";
	ln -s "$source_dir/Packages/$f" "$target_dir/Packages/User/$f";
done

