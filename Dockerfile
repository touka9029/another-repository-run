FROM konomochi/python-selenium-base

RUN apk --update --no-cache add openssh

COPY source_checkout_start.sh .

EXPOSE 8000

CMD [ "bash", "source_checkout_start.sh" ]
