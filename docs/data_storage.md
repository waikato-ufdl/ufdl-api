Instead of storing data items (images, audio or video files) in a database,
they simply get stored on disk. In order to avoid a skewed distribution
files, a hash-based approach to creating a directory structure is used:

* compute hash for data item using the content, not just the name, in order 
  to allow for deduplication (eg dog.jpg generates AABBCCDD as hash)
* create directory structure (eg from AABBCCDD generate /AA/BB)
* place file in that directory, using the hash as name (eg /AA/BB/AABBCCDD.jpg)

# See also:
* [File Name Hashing: Creating a Hashed Directory Structure](https://medium.com/eonian-technologies/file-name-hashing-creating-a-hashed-directory-structure-eabb03aa4091)

