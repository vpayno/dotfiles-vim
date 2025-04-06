{
  description = "My vim classic configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    systems.url = "github:vpayno/nix-systems-default";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    vimconf-src = {
      flake = false;
      url = "github:vpayno/dotfiles-vim?submodules=1&ref=main";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      vimconf-src,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pname = "vim-conf";
        version = "0.1.0";
        name = "${pname}-${version}";

        pkgs = nixpkgs.legacyPackages.${system};

        vimNativePkg = if pkgs.stdenv.isDarwin then pkgs.vim-darwin else pkgs.vim-full;

        pythonWithPackages = pkgs.python3.withPackages (
          ps: with ps; [
            aiosqlite
            anysqlite
            autoflake
            autopep8
            bandit
            black
            # black-macchiato # test error
            coverage
            debugpy
            decorator
            demjson3
            docutils
            flake8
            flake8-blind-except
            flake8-bugbear
            flake8-class-newline
            flake8-deprecated
            flake8-docstrings
            flake8-future-import
            flake8-import-order
            flake8-length
            flake8-polyfill
            flake8-quotes
            flynt
            gnureadline
            ipykernel
            ipython-genutils
            ipywidgets
            isoduration
            isort
            itsdangerous
            jedi
            jedi-language-server
            jinja2
            jinja2-time
            jsonschema
            lsprotocol
            mccabe
            mdformat
            mdformat-footnote
            mdformat-frontmatter
            mdformat-gfm
            # mdformat-mkdocs
            mdformat-myst
            mdformat-tables
            mdformat-toc
            mypy
            mypy-extensions
            mypy-protobuf
            pep8
            pep8-naming
            pexpect
            prompt-toolkit
            pycodestyle
            pydantic
            pydocstyle
            pyflakes
            pylama
            pylint
            pylint-celery
            pylint-django
            pylint-flask
            pylint-plugin-utils
            pylint-venv
            pyls-spyder
            # pyroma # not for py312
            pytest
            pytest-aio
            pytest-aiohttp
            pytest-annotate
            pytest-ansible
            pytest-arraydiff
            pytest-astropy
            pytest-astropy-header
            pytest-asyncio
            pytest-base-url
            pytest-bdd
            pytest-benchmark
            pytest-black
            pytest-cache
            pytest-cases
            pytest-catchlog
            pytest-celery
            pytest-check
            pytest-cid
            pytest-click
            pytest-codspeed
            pytest-console-scripts
            (pkgs.lib.hiPrio pytest-cov)
            # pytest-cov-stub
            # pytest-cram # not for py312
            pytest-datadir
            pytest-datafiles
            pytest-dependency
            pytest-describe
            pytest-django
            pytest-docker-tools
            pytest-doctestplus
            pytest-dotenv
            pytest-emoji
            # pytest-env
            pytest-error-for-skips
            pytest-examples
            pytest-expect
            pytest-factoryboy
            pytest-filter-subpackage
            pytest-fixture-config
            pytest-flake8
            pytest-flakes
            pytest-flask
            pytest-forked
            pytest-freezegun
            pytest-freezer
            pytest-golden
            pytest-grpc
            pytest-harvest
            pytest-helpers-namespace
            pytest-html
            pytest-httpbin
            pytest-httpserver
            pytest-httpx
            pytest-image-diff
            pytest-instafail
            pytest-isort
            pytest-json-report
            pytest-jupyter
            # pytest-kafka # undefined
            pytest-lazy-fixture
            pytest-lazy-fixtures
            pytest-localserver
            pytest-logdog
            pytest-lsp
            pytest-markdown-docs
            pytest-md-report
            pytest-metadata
            pytest-mock
            pytest-mockito
            pytest-mockservers
            pytest-mpi
            pytest-mpl
            pytest-mypy
            pytest-mypy-plugins
            pytest-notebook
            pytest-order
            pytest-parallel
            pytest-param-files
            pytest-playwright
            pytest-plt
            pytest-pook
            pytest-postgresql
            pytest-pudb
            pytest-pylint
            pytest-pytestrail
            pytest-qt
            pytest-quickcheck
            pytest-raises
            pytest-raisesregexp
            pytest-raisin
            pytest-random-order
            pytest-randomly
            pytest-recording
            pytest-regressions
            pytest-relaxed
            pytest-remotedata
            pytest-repeat
            pytest-rerunfailures
            pytest-resource-path
            pytest-responses
            pytest-reverse
            pytest-ruff
            pytest-selenium
            # pytest-server-fixtures # pulls in pytest-shutil
            pytest-services
            pytest-shared-session-scope # undefined
            # pytest-shutil # test error
            pytest-smtpd
            pytest-snapshot
            pytest-socket
            pytest-spec
            pytest-subprocess
            pytest-subtesthack
            pytest-subtests
            pytest-sugar
            pytest-tap
            pytest-test-utils
            pytest-testinfra
            pytest-testmon
            pytest-textual-snapshot
            pytest-timeout
            pytest-tornado
            pytest-tornasync
            pytest-trio
            pytest-twisted
            pytest-unordered
            pytest-variables
            pytest-vcr
            # pytest-virtualenv # pulls in shutil
            pytest-voluptuous
            pytest-warnings
            pytest-watch
            pytestcache
            pytestquickcheck
            radon
            rich
            rich-argparse
            rich-argparse-plus
            rich-click
            rich-pixels
            rich-rst
            rich-theme-manager
            rich-toolkit
            rope
            ruff
            ruff-api
            ruff-lsp
            safety
            # semgrep # error: Alias pythonPackages is still in python-packages.nix
            semver
            tabulate
            textual
            textual-dev
            toml
            tomli
            tomli-w
            tomlkit
            types-aiobotocore
            types-aiobotocore-accessanalyzer
            types-aiobotocore-account
            types-aiobotocore-acm
            types-aiobotocore-acm-pca
            types-aiobotocore-alexaforbusiness
            types-aiobotocore-amp
            types-aiobotocore-amplify
            types-aiobotocore-amplifybackend
            types-aiobotocore-amplifyuibuilder
            types-aiobotocore-apigateway
            types-aiobotocore-apigatewaymanagementapi
            types-aiobotocore-apigatewayv2
            types-aiobotocore-appconfig
            types-aiobotocore-appconfigdata
            types-aiobotocore-appfabric
            types-aiobotocore-appflow
            types-aiobotocore-appintegrations
            types-aiobotocore-application-autoscaling
            types-aiobotocore-application-insights
            types-aiobotocore-applicationcostprofiler
            types-aiobotocore-appmesh
            types-aiobotocore-apprunner
            types-aiobotocore-appstream
            types-aiobotocore-appsync
            types-aiobotocore-arc-zonal-shift
            types-aiobotocore-athena
            types-aiobotocore-auditmanager
            types-aiobotocore-autoscaling
            types-aiobotocore-autoscaling-plans
            types-aiobotocore-backup
            types-aiobotocore-backup-gateway
            types-aiobotocore-backupstorage
            types-aiobotocore-batch
            types-aiobotocore-billingconductor
            types-aiobotocore-braket
            types-aiobotocore-budgets
            types-aiobotocore-ce
            types-aiobotocore-chime
            types-aiobotocore-chime-sdk-identity
            types-aiobotocore-chime-sdk-media-pipelines
            types-aiobotocore-chime-sdk-meetings
            types-aiobotocore-chime-sdk-messaging
            types-aiobotocore-chime-sdk-voice
            types-aiobotocore-cleanrooms
            types-aiobotocore-cloud9
            types-aiobotocore-cloudcontrol
            types-aiobotocore-clouddirectory
            types-aiobotocore-cloudformation
            types-aiobotocore-cloudfront
            types-aiobotocore-cloudhsm
            types-aiobotocore-cloudhsmv2
            types-aiobotocore-cloudsearch
            types-aiobotocore-cloudsearchdomain
            types-aiobotocore-cloudtrail
            types-aiobotocore-cloudtrail-data
            types-aiobotocore-cloudwatch
            types-aiobotocore-codeartifact
            types-aiobotocore-codebuild
            types-aiobotocore-codecatalyst
            types-aiobotocore-codecommit
            types-aiobotocore-codedeploy
            types-aiobotocore-codeguru-reviewer
            types-aiobotocore-codeguru-security
            types-aiobotocore-codeguruprofiler
            types-aiobotocore-codepipeline
            types-aiobotocore-codestar
            types-aiobotocore-codestar-connections
            types-aiobotocore-codestar-notifications
            types-aiobotocore-cognito-identity
            types-aiobotocore-cognito-idp
            types-aiobotocore-cognito-sync
            types-aiobotocore-comprehend
            types-aiobotocore-comprehendmedical
            types-aiobotocore-compute-optimizer
            types-aiobotocore-config
            types-aiobotocore-connect
            types-aiobotocore-connect-contact-lens
            types-aiobotocore-connectcampaigns
            types-aiobotocore-connectcases
            types-aiobotocore-connectparticipant
            types-aiobotocore-controltower
            types-aiobotocore-cur
            types-aiobotocore-customer-profiles
            types-aiobotocore-databrew
            types-aiobotocore-dataexchange
            types-aiobotocore-datapipeline
            types-aiobotocore-datasync
            types-aiobotocore-dax
            types-aiobotocore-detective
            types-aiobotocore-devicefarm
            types-aiobotocore-devops-guru
            types-aiobotocore-directconnect
            types-aiobotocore-discovery
            types-aiobotocore-dlm
            types-aiobotocore-dms
            types-aiobotocore-docdb
            types-aiobotocore-docdb-elastic
            types-aiobotocore-drs
            types-aiobotocore-ds
            types-aiobotocore-dynamodb
            types-aiobotocore-dynamodbstreams
            types-aiobotocore-ebs
            types-aiobotocore-ec2
            types-aiobotocore-ec2-instance-connect
            types-aiobotocore-ecr
            types-aiobotocore-ecr-public
            types-aiobotocore-ecs
            types-aiobotocore-efs
            types-aiobotocore-eks
            types-aiobotocore-elastic-inference
            types-aiobotocore-elasticache
            types-aiobotocore-elasticbeanstalk
            types-aiobotocore-elastictranscoder
            types-aiobotocore-elb
            types-aiobotocore-elbv2
            types-aiobotocore-emr
            types-aiobotocore-emr-containers
            types-aiobotocore-emr-serverless
            types-aiobotocore-entityresolution
            types-aiobotocore-es
            types-aiobotocore-events
            types-aiobotocore-evidently
            types-aiobotocore-finspace
            types-aiobotocore-finspace-data
            types-aiobotocore-firehose
            types-aiobotocore-fis
            types-aiobotocore-fms
            types-aiobotocore-forecast
            types-aiobotocore-forecastquery
            types-aiobotocore-frauddetector
            types-aiobotocore-fsx
            types-aiobotocore-gamelift
            types-aiobotocore-gamesparks
            types-aiobotocore-glacier
            types-aiobotocore-globalaccelerator
            types-aiobotocore-glue
            types-aiobotocore-grafana
            types-aiobotocore-greengrass
            types-aiobotocore-greengrassv2
            types-aiobotocore-groundstation
            types-aiobotocore-guardduty
            types-aiobotocore-health
            types-aiobotocore-healthlake
            types-aiobotocore-honeycode
            types-aiobotocore-iam
            types-aiobotocore-identitystore
            types-aiobotocore-imagebuilder
            types-aiobotocore-importexport
            types-aiobotocore-inspector
            types-aiobotocore-inspector2
            types-aiobotocore-internetmonitor
            types-aiobotocore-iot
            types-aiobotocore-iot-data
            types-aiobotocore-iot-jobs-data
            types-aiobotocore-iot-roborunner
            types-aiobotocore-iot1click-devices
            types-aiobotocore-iot1click-projects
            types-aiobotocore-iotanalytics
            types-aiobotocore-iotdeviceadvisor
            types-aiobotocore-iotevents
            types-aiobotocore-iotevents-data
            types-aiobotocore-iotfleethub
            types-aiobotocore-iotfleetwise
            types-aiobotocore-iotsecuretunneling
            types-aiobotocore-iotsitewise
            types-aiobotocore-iotthingsgraph
            types-aiobotocore-iottwinmaker
            types-aiobotocore-iotwireless
            types-aiobotocore-ivs
            types-aiobotocore-ivs-realtime
            types-aiobotocore-ivschat
            types-aiobotocore-kafka
            types-aiobotocore-kafkaconnect
            types-aiobotocore-kendra
            types-aiobotocore-kendra-ranking
            types-aiobotocore-keyspaces
            types-aiobotocore-kinesis
            types-aiobotocore-kinesis-video-archived-media
            types-aiobotocore-kinesis-video-media
            types-aiobotocore-kinesis-video-signaling
            types-aiobotocore-kinesis-video-webrtc-storage
            types-aiobotocore-kinesisanalytics
            types-aiobotocore-kinesisanalyticsv2
            types-aiobotocore-kinesisvideo
            types-aiobotocore-kms
            types-aiobotocore-lakeformation
            types-aiobotocore-lambda
            types-aiobotocore-lex-models
            types-aiobotocore-lex-runtime
            types-aiobotocore-lexv2-models
            types-aiobotocore-lexv2-runtime
            types-aiobotocore-license-manager
            types-aiobotocore-license-manager-linux-subscriptions
            types-aiobotocore-license-manager-user-subscriptions
            types-aiobotocore-lightsail
            types-aiobotocore-location
            types-aiobotocore-logs
            types-aiobotocore-lookoutequipment
            types-aiobotocore-lookoutmetrics
            types-aiobotocore-lookoutvision
            types-aiobotocore-m2
            types-aiobotocore-machinelearning
            types-aiobotocore-macie
            types-aiobotocore-macie2
            types-aiobotocore-managedblockchain
            types-aiobotocore-managedblockchain-query
            types-aiobotocore-marketplace-catalog
            types-aiobotocore-marketplace-entitlement
            types-aiobotocore-marketplacecommerceanalytics
            types-aiobotocore-mediaconnect
            types-aiobotocore-mediaconvert
            types-aiobotocore-medialive
            types-aiobotocore-mediapackage
            types-aiobotocore-mediapackage-vod
            types-aiobotocore-mediapackagev2
            types-aiobotocore-mediastore
            types-aiobotocore-mediastore-data
            types-aiobotocore-mediatailor
            types-aiobotocore-medical-imaging
            types-aiobotocore-memorydb
            types-aiobotocore-meteringmarketplace
            types-aiobotocore-mgh
            types-aiobotocore-mgn
            types-aiobotocore-migration-hub-refactor-spaces
            types-aiobotocore-migrationhub-config
            types-aiobotocore-migrationhuborchestrator
            types-aiobotocore-migrationhubstrategy
            types-aiobotocore-mobile
            types-aiobotocore-mq
            types-aiobotocore-mturk
            types-aiobotocore-mwaa
            types-aiobotocore-neptune
            types-aiobotocore-network-firewall
            types-aiobotocore-networkmanager
            types-aiobotocore-nimble
            types-aiobotocore-oam
            types-aiobotocore-omics
            types-aiobotocore-opensearch
            types-aiobotocore-opensearchserverless
            types-aiobotocore-opsworks
            types-aiobotocore-opsworkscm
            types-aiobotocore-organizations
            types-aiobotocore-osis
            types-aiobotocore-outposts
            types-aiobotocore-panorama
            types-aiobotocore-payment-cryptography
            types-aiobotocore-payment-cryptography-data
            types-aiobotocore-personalize
            types-aiobotocore-personalize-events
            types-aiobotocore-personalize-runtime
            types-aiobotocore-pi
            types-aiobotocore-pinpoint
            types-aiobotocore-pinpoint-email
            types-aiobotocore-pinpoint-sms-voice
            types-aiobotocore-pinpoint-sms-voice-v2
            types-aiobotocore-pipes
            types-aiobotocore-polly
            types-aiobotocore-pricing
            types-aiobotocore-privatenetworks
            types-aiobotocore-proton
            types-aiobotocore-qldb
            types-aiobotocore-qldb-session
            types-aiobotocore-quicksight
            types-aiobotocore-ram
            types-aiobotocore-rbin
            types-aiobotocore-rds
            types-aiobotocore-rds-data
            types-aiobotocore-redshift
            types-aiobotocore-redshift-data
            types-aiobotocore-redshift-serverless
            types-aiobotocore-rekognition
            types-aiobotocore-resiliencehub
            types-aiobotocore-resource-explorer-2
            types-aiobotocore-resource-groups
            types-aiobotocore-resourcegroupstaggingapi
            types-aiobotocore-robomaker
            types-aiobotocore-rolesanywhere
            types-aiobotocore-route53
            types-aiobotocore-route53-recovery-cluster
            types-aiobotocore-route53-recovery-control-config
            types-aiobotocore-route53-recovery-readiness
            types-aiobotocore-route53domains
            types-aiobotocore-route53resolver
            types-aiobotocore-rum
            types-aiobotocore-s3
            types-aiobotocore-s3control
            types-aiobotocore-s3outposts
            types-aiobotocore-sagemaker
            types-aiobotocore-sagemaker-a2i-runtime
            types-aiobotocore-sagemaker-edge
            types-aiobotocore-sagemaker-featurestore-runtime
            types-aiobotocore-sagemaker-geospatial
            types-aiobotocore-sagemaker-metrics
            types-aiobotocore-sagemaker-runtime
            types-aiobotocore-savingsplans
            types-aiobotocore-scheduler
            types-aiobotocore-schemas
            types-aiobotocore-sdb
            types-aiobotocore-secretsmanager
            types-aiobotocore-securityhub
            types-aiobotocore-securitylake
            types-aiobotocore-serverlessrepo
            types-aiobotocore-service-quotas
            types-aiobotocore-servicecatalog
            types-aiobotocore-servicecatalog-appregistry
            types-aiobotocore-servicediscovery
            types-aiobotocore-ses
            types-aiobotocore-sesv2
            types-aiobotocore-shield
            types-aiobotocore-signer
            types-aiobotocore-simspaceweaver
            types-aiobotocore-sms
            types-aiobotocore-sms-voice
            types-aiobotocore-snow-device-management
            types-aiobotocore-snowball
            types-aiobotocore-sns
            types-aiobotocore-sqs
            types-aiobotocore-ssm
            types-aiobotocore-ssm-contacts
            types-aiobotocore-ssm-incidents
            types-aiobotocore-ssm-sap
            types-aiobotocore-sso
            types-aiobotocore-sso-admin
            types-aiobotocore-sso-oidc
            types-aiobotocore-stepfunctions
            types-aiobotocore-storagegateway
            types-aiobotocore-sts
            types-aiobotocore-support
            types-aiobotocore-support-app
            types-aiobotocore-swf
            types-aiobotocore-synthetics
            types-aiobotocore-textract
            types-aiobotocore-timestream-query
            types-aiobotocore-timestream-write
            types-aiobotocore-tnb
            types-aiobotocore-transcribe
            types-aiobotocore-transfer
            types-aiobotocore-translate
            types-aiobotocore-verifiedpermissions
            types-aiobotocore-voice-id
            types-aiobotocore-vpc-lattice
            types-aiobotocore-waf
            types-aiobotocore-waf-regional
            types-aiobotocore-wafv2
            types-aiobotocore-wellarchitected
            types-aiobotocore-wisdom
            types-aiobotocore-workdocs
            types-aiobotocore-worklink
            types-aiobotocore-workmail
            types-aiobotocore-workmailmessageflow
            types-aiobotocore-workspaces
            types-aiobotocore-workspaces-web
            types-aiobotocore-xray
            types-appdirs
            types-appdirs
            types-awscrt
            types-beautifulsoup4
            types-click
            types-colorama
            types-dataclasses
            # types-dateutil
            types-decorator
            types-deprecated
            types-docopt
            types-docutils
            types-freezegun
            types-futures
            types-greenlet
            types-html5lib
            types-ipaddress
            types-jinja2
            # types-lxml # build error
            types-markdown
            types-markupsafe
            types-mock
            types-pillow
            types-protobuf
            types-psutil
            types-psycopg2
            types-pyopenssl
            # types-python-dateutil # collision with older version
            types-pytz
            types-pyyaml
            types-redis
            types-requests
            types-retry
            types-s3transfer
            types-setuptools
            types-tabulate
            types-toml
            types-tqdm
            types-typed-ast
            types-ujson
            types-urllib3
            types-xxhash
          ]
        );

        rubyWithPackages = with pkgs.rubyPackages; [
          rubocop
          ruby-lsp
          solargraph
          prettier
        ];

        toolPkgs =
          [
            pythonWithPackages
          ]
          ++ rubyWithPackages
          ++ (with pkgs; [
            # prospector # pulls in pyroma
            # xmlroff # build error
            coreutils
            moreutils

            ansible-language-server
            ansible-lint
            arduino-language-server
            autotools-language-server
            awk-language-server
            bacon
            bash
            bash-language-server
            bottom
            cargo
            cargo-audit
            cargo-auditable
            cargo-chef
            cargo-edit
            cargo-expand
            cargo-fuzz
            cargo-info
            cargo-llvm-cov
            cargo-outdated
            cargo-vet
            cargo-watch
            ccls
            clang
            clang-analyzer
            clang-manpages
            clang-tidy-sarif
            clang-tools
            cmake-language-server
            cmake-language-server
            cmake-lint
            codechecker
            codechecker
            commitlint
            corepack
            cue
            cuelsp
            detekt
            dockerfile-language-server-nodejs
            dockerfile-language-server-nodejs
            dot-language-server
            dprint
            fixjson
            flatito
            flawfinder
            fortran-language-server
            fzf
            gh
            ghc
            git-conventional-commits
            glab
            glas
            gleam
            gopls
            haskell-language-server
            hatch
            ihaskell
            irust
            java-language-server
            jsonnet-language-server
            jsonnet-language-server
            kotlin-interactive-shell
            kotlin-language-server
            kotlin-language-server
            kotlin-native
            ktfmt
            ktlint
            litecli
            lua-language-server
            markdownlint-cli
            markdownlint-cli2
            nginx-language-server
            npm-check
            npm-check-updates
            npm-lockfile-fix
            openjdk11_headless
            openjdk17_headless
            openjdk21_headless
            pdm
            perl
            proselint
            pyright
            readline
            refurb
            rufo
            rust-audit-info
            rustc
            rye
            sccache
            spectral-language-server
            sqlfluff
            sqlite-utils
            sqlpkg-cli
            src-cli
            stack
            systemd-language-server
            tealdeer
            textlint
            textlint-rule-common-misspellings
            textlint-rule-stop-words
            textlint-rule-terminology
            textlint-rule-unexpanded-acronym
            textlint-rule-write-good
            tldr
            tlrc
            tmuxp
            typos
            typos-lsp
            uv
            vim-language-server
            vim-vint
            vscode-langservers-extracted
            wasm-language-tools
            write-good
            xmlformat
            xmlindent
            xq-xml
            yaml-language-server
            yamlfix
            yamllint
            yapf
            yarn
          ]);

        pluginPkgs = with pkgs.vimPlugins; [
          Hoogle
          (pkgs.lib.hiPrio The_NERD_tree) # doc/tags
          #(pkgs.lib.hiPrio The_NERD_Commenter) # LICENSE
          (pkgs.lib.lowPrio ack-vim) # LICENSE
          #aerial-nvim
          airline
          ale
          ansible-vim
          calendar-vim
          catppuccin-vim
          colorizer
          dashboard-nvim
          (pkgs.lib.lowPrio fzf-hoogle-vim) # doc/tags
          fzf-lsp-nvim
          fzf-lsp-nvim
          gitignore-vim
          gruvbox
          harpoon2
          indentLine
          jinja-vim
          jq-vim
          jsonc-vim
          onedark-vim
          onedarker-nvim
          surround
        ];

        # just ./. skips all gisubmodules
        vimrcdir-src = vimconf-src;
      in
      {
        packages = {
          default = pkgs.buildEnv {
            inherit pname version name;
            meta = {
              mainProgram = "bin/vim";
            };
            buildInputs = with pkgs; [
              coreutils
              makeWrapper
              tree
            ];
            paths = [ vimNativePkg ]; # ++ toolPkgs ++ pluginPkgs;
            ignoreCollisions = false;
            postBuild = ''
              tree $out

              bin_path="${pkgs.lib.makeBinPath toolPkgs}"

              runtime_paths="$(printf "%s," ~/.vim/pack/*/*/* | sed -r -e 's/,$//g')"

              for p in "$out"/bin/*; do
                if [[ ! -x $p ]]; then
                  continue
                fi

                echo wrapProgram "$p" \
                  --prefix PATH : "$bin_path" \
                  --set IN_NIX_FLAKE "1" \
                  --set VIM "${vimrcdir-src}" \
                  --set MYVIMDIR "${vimrcdir-src}" \
                  --set MYVIMRC "${vimrcdir-src}/vimrc" \
                  --set VIMRUNTIME "${vimNativePkg}/share/vim/vim91"
                wrapProgram "$p" \
                  --prefix PATH : "$bin_path" \
                  --set IN_NIX_FLAKE "1" \
                  --set VIM "${vimrcdir-src}" \
                  --set MYVIMDIR "${vimrcdir-src}" \
                  --set MYVIMRC "${vimrcdir-src}/vimrc" \
                  --set VIMRUNTIME "${vimNativePkg}/share/vim/vim91"
              done
            '';
          };
        };

        apps = {
          default = {
            type = "app";
            program = "${self.packages.${system}.default}/bin/vim";
          };
        };
      }
    );
}
