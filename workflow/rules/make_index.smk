# Make index consisting of main system (protein + Zn)
rule make_index:
    input:
        gro = f"{DATA_DIR}/{{variant}}/{{variant}}.gro",
    output:
        idx = f"{DATA_DIR}/{{variant}}/index.ndx",
    shell:
        """
        printf "0\nq\n" | gmx make_ndx \
            -f {input.gro} \
            -o {output.idx}
        """
        