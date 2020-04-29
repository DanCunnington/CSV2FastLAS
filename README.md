# CSV2FastLAS

Convert Tabular CSV data to a FastLAS learning task.

## Dependencies
* sklearn
* pandas
* numpy

These can be installed using the requirements.txt file:
```bash
pip install -r requirements.txt
```

## Usage
```bash
python convert.py input.csv predictor_column_name > output.las
```
For additional usage options:
```
python convert.py -h
```