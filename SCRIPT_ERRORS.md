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
mkdir ~/test/week_1/fastq/;
mkdir ~/test/week_1/fasta/;
mkdir ~/test/week_1/metadata/;
```

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
mv *.fastq.gz ~/test/week_1/fastq/;
mv *.fasta ~/test/week_1/fasta/;
mv *.csv ~/test/week_1/metadata/;
```

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
ls ~/test/week_1/fastq/*.fastq.gz | wc -l;
ls ~/test/week_1/fasta/*.fasta | wc -l;
ls ~/test/week_1/metadata/*.csv | wc -l
```

---

## Summary

All paths have been corrected to use the full `~/test/week_1/` prefix consistently throughout the script. The file counting logic now correctly lists files from their new locations after they've been moved.
