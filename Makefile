OS = $(shell uname)

# COLORS
RED    = $(shell printf "\33[31m")
GREEN  = $(shell printf "\33[32m")
WHITE  = $(shell printf "\33[37m")
YELLOW = $(shell printf "\33[33m")
RESET  = $(shell printf "\33[0m")

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  HELP
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

.DEFAULT: help

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  DEVELOPMENT
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

development_setup:
	@echo "${YELLO}Setup development environment...${RESET}"
	@pip install -r requirements/dev.txt
	@echo "${GREEN}✔ setup finished successfully${RESET}\n"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  BUILD
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

test:
	@echo "${YELLOW}Running all tests${RESET}\n"
	@pytest
	@echo "${GREEN}✔ well done!${RESET}\n"

lint:
	@echo "${YELLOW}Linting...${RESET}\n"
	@flake8
	@pylint ./cabot_alert_typetalk
	@echo "${GREEN}✔ well done!${RESET}\n"	

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
#  BUILD
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

build_prepare:
	@echo "${YELLOW}Preparing for build...${RESET}"
	@python -m pip install --user --upgrade setuptools wheel twine
	@echo "${GREEN}✔ setup finished successfully${RESET}\n"

build:
	@echo "${YELLOW}Building...${RESET}"
	@python setup.py sdist bdist_wheel
	@echo "${GREEN}✔ successfully built${RESET}\n"

upload:
	@echo "${YELLOW}Uploading...${RESET}"
	@twine upload dist/*
	@echo "${GREEN}✔ successfully uploaded${RESET}\n"