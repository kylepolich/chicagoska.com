* Pull run-experiments-update-api branch
* add file ccm/ccm/.ENV w/ variable
```
HOST="http://localhost:8000"
```
	- Kyle use `localhost:8000` initially to verify the codebase works, then switch env var to prod endpoint after deploying
	- `ccm/api/` files already updated with `ccm/deploy.sh`, just need to `chalice deploy`
* load custom visibilities from unit tests with `load_unit_test_visibility_csvs.py`
	- note the prefix you upload with, default is `ccm`
	- if you change the prefix, need to update the prefix used in run_experiments.py
* run `python3 run_experiments.py`
	- will execute the experiments listed in experiments variable
	- the experimental conditions have format `({visibilities prefix}, {use case})`
		- visibility prefix should be the parent of the visibilities file to use for the experiment
		- eg `('/ccm/SSU', 'default')` will look for a csv at `s3://{bucket_name}/ccm/SSU/visibilities.csv`
		- the use case should correspond to one of the `named_prefs` in experiment.py
		- currently each of the named_prefs are used once in the list of experiments
* view the results in `ccm/experiments/{datetime}/{use_case}.png`

Additional Notes:
* experiments.py runs the scheduler locally (does CRUD operations via API)
* Careful about where you say the visibilities.csv are located
