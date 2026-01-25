# Shell Script Error Analysis - homework_01.sh

## Errors Found and Fixed

### 1. **mkdir path inconsistencies (Lines 9-11)**
**Original:**
```bash
mkdir week_1/fastq/;
mkdir week_1/fasta/;
mkdir week_1/metadata/;
```

**Issue:** Creates directories relative to the current directory (`~/test/week_1/week_1/...`) instead of the intended location.

**Fixed:**
```bash
mkdir fastq/;
mkdir fasta/;
mkdir metadata/;
```

**Note:** Since the script changes to `~/test/week_1/` at line 6, we can use relative paths for cleaner, more maintainable code.

---

### 2. **mv command path inconsistencies (Lines 15-17)**
**Original:**
```bash
mv *.fastq.gz ~/week_1/fastq/;
mv *.fasta ~/week_1/fasta/;
mv *.csv ~/week_1/metadata/;
```

**Issue:** Uses `~/week_1/` instead of `~/test/week_1/`, which doesn't match the directory structure.

**Fixed:**
```bash
mv *.fastq.gz fastq/;
mv *.fasta fasta/;
mv *.csv metadata/;
```

**Note:** Using relative paths after the `cd` command makes the script cleaner and easier to maintain.

---

### 3. **ls/wc command issues (Lines 21-23)**
**Original:**
```bash
ls *.fastq.gz ~/fastq/ | wc -l;
ls *.fasta ~/fasta/ | wc -l;
ls *.csv ~/metadata | wc -l
```

**Issues:**
- Wrong paths: `~/fastq/` instead of `~/test/week_1/fastq/`
- Incorrect ls syntax: trying to list both pattern and directory
- After the mv commands, the files won't be in the current directory anymore

**Fixed:**
```bash
ls fastq/*.fastq.gz | wc -l;
ls fasta/*.fasta | wc -l;
ls metadata/*.csv | wc -l
```

**Note:** Using relative paths is cleaner since we're already in the `~/test/week_1/` directory.

---

## Summary

All paths have been corrected to work properly with the directory structure. The script now uses relative paths after the `cd ~/test/week_1/` command, which makes it cleaner, more maintainable, and less error-prone. The file counting logic now correctly lists files from their new locations after they've been moved.
