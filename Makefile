.PHONY: dependencies build-runner generate-code all-dev all-stg all-prod

all-dev: dependencies generate-code run-dev

all-stg: dependencies generate-code run-stg

all-prod: dependencies generate-code run-prod

dependencies:
	flutter pub get

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

generate-code:
	@for module in . common domain data home; do \
		$(MAKE) -C $$module dependencies; \
		$(MAKE) -C $$module build-runner; \
	done

run-dev:
	flutter run --target lib/main_dev.dart --flavor dev $(FLAGS)

run-stg:
	flutter run --target lib/main_stg.dart --flavor stg $(FLAGS)

run-prod:
	flutter run --target lib/main_prod.dart --flavor prod $(FLAGS)