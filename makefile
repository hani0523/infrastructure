VENV = venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip
LAMBDA_FUNCTION_ORDER = lambda_jwt_authorizer

.PHONY: clean zip 

zip: $(VENV)/bin/activate


$(VENV)/bin/activate:
	python3 -m venv $(VENV)
	for names in $(LAMBDA_FUNCTION_ORDER); do \
	  cd lambda/$${names}; zip -r $${names}.zip *;mkdir -p ../../bin; mv $${names}.zip ../../bin; cd ../../; \
        done

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
	rm -rf ./bin
