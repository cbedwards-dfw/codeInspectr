# Delete a directory, retrying on transient Windows file locks

Useful for deleting temporary Github clones.

## Usage

``` r
safe_dir_delete(path, attempts = 5, wait_seconds = 0.3)
```

## Arguments

- path:

  Directory to delete.

- attempts:

  Number of attempts before giving up.

- wait_seconds:

  Delay between attempts (grows each retry).

## Value

TRUE if deletion succeeded, FALSE otherwise (invisibly attempted).
