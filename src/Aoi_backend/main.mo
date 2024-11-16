import TrieMap "mo:base/TrieMap";
import Text "mo:base/Text";

actor FavoriteNumberTracker {
    // Define a TrieMap for Text keys and Int values
    var favoriteNumbers: TrieMap.TrieMap<Text, Int> = 
        TrieMap.TrieMap<Text, Int>(
            func (x: Text, y: Text): Bool { x == y }, // Comparison function
            Text.hash // Hash function for Text keys
        );

    // Set a favorite number for a user
    public func setFavoriteNumber(user: Text, number: Int): async () {
        favoriteNumbers.put(user, number);
    };

    // Get a user's favorite number
    public query func getFavoriteNumber(user: Text): async ?Int {
        return favoriteNumbers.get(user);
    };

    // Clear a user's favorite number
    public func clearFavoriteNumber(user: Text): async () {
        ignore favoriteNumbers.remove(user);
    };
}
