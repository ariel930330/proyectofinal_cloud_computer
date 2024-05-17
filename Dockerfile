FROM python:3.11.9

WORKDIR /penguins_streamlit

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD penguins.csv ./penguins.csv
ADD random_forest_penguin.pickle ./random_forest_penguin.pickle 
ADD output_penguin.pickle ./output_penguin.pickle 

ADD penguins_streamlit.py .

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "penguins_streamlit.py", "--server.port=8501", "--server.address=0.0.0.0"]  