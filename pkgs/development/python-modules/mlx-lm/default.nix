{ buildPythonPackage
, fetchFromGitHub
, jinja2
, lib
, mlx
, numpy
, protobuf
, pyyaml
, transformers
}:

buildPythonPackage rec {
  pname = "mlx-lm";

  version = "0.20.4";

  src = fetchFromGitHub {
    owner = "ml-explore";
    repo = "mlx-examples";
    rev = "9f2ea5892e3a9517853c526a928268250741f623";
    hash = "sha256-ooXqwCfzPrm97h8UI2E7Dzk6N4sDe29a5uODvsIZFxc=";
  };

  prePatch = "cd llms";

  buildInputs = [
    mlx
    numpy
    transformers
    protobuf
    pyyaml
    jinja2
  ];

  meta = {
    homepage = "https://github.com/ml-explore/mlx-examples";
    description = "Generate Text with LLMs and MLX";
    license = lib.licenses.mit;
    platforms = [ "aarch64-darwin" ];
    maintainers = [
      lib.maintainers.Gabriella439
    ];
  };
}
