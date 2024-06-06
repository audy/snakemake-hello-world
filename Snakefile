def get_file_names(wildcards):
    """
    Use to dynamically generate input for a rule based on the output of a
    wildcard. This means that the value is re-calculated *after* the wildcard
    rule finishes.

    You can also just use directory("split_by_length") and it will work but
    the value of {input} will not contain all of the file names.
    """
    ck_output = checkpoints.line_length.get(**wildcards).output[0]
    file, = glob_wildcards(os.path.join(ck_output, "{file}.txt"))
    return expand(os.path.join(ck_output, "{file}.txt"), file=file)

# the "reduce" step. Just list the inputs.
rule all:
    input:
      # directory("split_by_length") also works fine ...
      get_file_names
    shell:
      """
      echo {input}
      """

# the "map" step. Just split the input into multiple files based on some
# arbitrary thing like line length
checkpoint line_length:
  input:
    "input.txt"
  output:
    directory("split_by_length")
  container:
    "docker://python:latest"
  shell:
    """
    python split-by-length.py {input} {output}
    """
