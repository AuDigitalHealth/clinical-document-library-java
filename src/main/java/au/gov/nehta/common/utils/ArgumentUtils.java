package au.gov.nehta.common.utils;

import java.util.Collection;

/**
 * Utility class to perform validation on method arguments.
 *
 * <p>
 * Public and protected methods should throw an exception if invalid arguments
 * are passed to them. This class has convenience methods for commonly-used
 * checks.
 * </p>
 *
 * <p>
 * Example Usage:
 * </p>
 *
 * <pre>
 * public void doSomething(String name) {
 *   ArgumentUtils.checkNotNullNorBlank(name, &quot;name&quot;);
 *   ...
 * }
 * </pre>
 */
public final class ArgumentUtils {

    /**
     * Throws an exception if an argument value is null.
     *
     * @param value Value of the argument to check.
     * @param name  Name of the argument.
     * @throws IllegalArgumentException If the argument is null.
     */
    public static void checkNotNull(Object value, String name) {
        assert (name != null) : "'name' is null.";

        if (value == null) {
            throw new IllegalArgumentException(name + " cannot be null.");
        }
    }

    /**
     * Throws an exception if a collection argument is null or has no items.
     *
     * @param collection A collection to check.
     * @param name       Name of the collection argument.
     * @throws NullPointerException     If the collection argument is null.
     * @throws IllegalArgumentException If the collection argument does not contain at least one item.
     */
    public static void checkNotNullNorEmpty(Collection<?> collection, String name) {
        assert (name != null) : "'name' is null.";

        checkNotNull(collection, name);
        if (collection.size() == 0) {
            throw new IllegalArgumentException(name
                    + " must contain at least one item.");
        }
    }

    /**
     * Throws an exception if a string argument is null, is an empty string or is
     * made of whitespace characters only.
     *
     * @param value Value of the string argument to check.
     * @param name  Name of the string argument.
     * @throws NullPointerException     If the string argument is null.
     * @throws IllegalArgumentException If the string argument is an empty string or is made of
     *                                  whitespace characters only.
     */
    public static void checkNotNullNorBlank(String value, String name) {
        assert (name != null) : "'name' is null.";

        checkNotNull(value, name);
        if ((value.length() == 0) || (value.trim().length() == 0)) {
            throw new IllegalArgumentException(name + " cannot be a blank string.");
        }
    }

    /**
     * Check that an argument is blank (null or empty string).
     *
     * @param value Value of the string argument to check.
     * @param name  Name of the string argument.
     * @throws IllegalArgumentException If the value argument is not null or an empty string.
     */
    public static void checkNullOrBlank(String value, String name) {
        assert (name != null) : "'name' is null.";

        if ((value != null) && (value.trim().length() > 0)) {
            throw new IllegalArgumentException("A value is not permitted for " + name
                    + ".");
        }
    }

    /**
     * Check that the length of a string does not exceed a max length.
     *
     * @param value  Value of the string argument to check.
     * @param maxLen Maximum length of the string argument.
     * @param name   Name of the string argument.
     * @throws IllegalArgumentException Exception to notify of max length being exceeded.
     */
    public static void checkMaxLength(String value, int maxLen, String name) {
        assert (name != null) : "'name' is null.";

        if ((value != null) && (value.length() > maxLen)) {
            throw new IllegalArgumentException("The value for " + name
                    + " exceeds the maximum permitted length of " + maxLen
                    + " characters.");
        }
    }

    /**
     * Checks if a collection argument is null or has no items.
     *
     * @param collection collection to check.
     * @return true if collection is collection is null or has no items.
     */
    public static boolean isNullOrEmpty(Collection<?> collection) {
        return ((collection == null) || (collection.size() == 0));
    }

    /**
     * Checks if a string argument is null or has no non-whitespace characters.
     *
     * @param value string value to check.
     * @return true if collection is collection is null or has no items.
     */
    public static boolean isNullOrBlank(String value) {
        return ((value == null) || (value.length() == 0) || (value.trim().length() == 0));
    }

    /**
     * Checks two arguments for equality, handling nulls.
     *
     * @param value1 first argument to check.
     * @param value2 second argument to check.
     * @return true if the two objects are both null or value1.equals(value2)
     * returns true.
     */
    public static boolean isEqual(Object value1, Object value2) {
        if (value1 == null) {
            return (value2 == null);
        } else {
            return value1.equals(value2);
        }
    }

    /*
     * Private constructor to prevent class instantiation.
     */
    private ArgumentUtils() {
    }
}
