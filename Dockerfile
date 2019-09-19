FROM konomochi/python-selenium-base

RUN apk --update --no-cache add openssh

COPY source_checkout_start.sh .

CMD [ "bash", "source_checkout_start.sh" ]
