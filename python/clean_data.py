import pandas as pd

INPUTH_FILE = 'Datos .tsv'

class DataTransform:

	def __init__(self, path, sep, input_encoding):
		self.df =  pd.read_csv(path, sep=sep, encoding=input_encoding)
		self.path = path
		self.delimiter = sep
		self.encoding = input_encoding

	def __str__(self):
		return "{} transform object".format(self.path)

	def set_delimiter(self, sep):
		self.delimiter = sep
		return self

	def set_encoding(self, encoding):
		self.encoding = encoding
		return self

	def save(self):
		output_path = self.path.split(".")[0].strip() + "_transofrmed.csv"
		self.df.to_csv(output_path, sep=self.delimiter, encoding=self.encoding, index=False)


if __name__ == "__main__":
	dt = DataTransform(path=INPUTH_FILE, sep='\t', input_encoding='UTF-16LE')
	dt.set_delimiter("|").set_encoding("utf-8").save()
