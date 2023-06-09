all-dev: generate-code run-dev

all-stg: generate-code run-stg

all-prod: generate-code run-prod

dependencies:
	flutter pub get

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

analyze:
	flutter analyze

generate-code:
	@for module in . common domain data features/home; do \
		$(MAKE) -C $$module dependencies; \
		$(MAKE) -C $$module build-runner; \
	done

run-dev:
	$(MAKE) analyze
	flutter run --target lib/main_dev.dart --flavor dev $(FLAGS)

run-stg:
	$(MAKE) analyze
	flutter run --target lib/main_stg.dart --flavor stg $(FLAGS)

run-prod:
	$(MAKE) analyze
	flutter run --target lib/main_prod.dart --flavor prod $(FLAGS)