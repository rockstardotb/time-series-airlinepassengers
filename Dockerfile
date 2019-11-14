FROM waleedka/modern-deep-learning

RUN pip install --upgrade pip
RUN pip install statsmodels

ADD . / /app/

