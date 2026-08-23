#!/bin/bash
# Run from inside your portfolio folder:  bash rename-images.sh
# Renames whatever is in images/ to the exact names index.html expects.
# Safe to run twice — it skips anything already named correctly.

cd images || { echo "No images/ folder here."; exit 1; }

ren() {  # ren <glob> <target>
  for f in $1; do
    [ -e "$f" ] || continue
    [ "$f" = "$2" ] && return
    mv -n "$f" "$2" && echo "  $f  ->  $2"
    return
  done
  echo "  MISSING: nothing matched '$1'  (expected $2)"
}

echo "Renaming..."
ren "nasa_ames*"                 nasa_ames_voxel_assembly.jpg
ren "sig_thrust_stand_wiring*"   sig_thrust_stand_wiring.png
ren "sig_screwsorter*"           sig_screwsorter_iterations.png
ren "sig_toolholder*"            sig_toolholder_cad.png
ren "sig_electroni*"             sig_electronics_enclosure_cad.png
ren "sig_pcb_modeling*"          sig_pcb_modeling_cad.png
ren "lumius_imag*"               lumius_imaging_design_ideas.jpg
ren "lumiusimagi*"               lumiusimaging_probedesign.png
ren "cpu_main*"                  cpu_main.png
ren "cpu_control_unit*"          cpu_control_unit.png
ren "cpu_register_file*"         cpu_register_file.png
ren "cpu_program_counter*"       cpu_program_counter.png
ren "cpu_single_register*"       cpu_single_register.png
ren "ece_110_robot*"             ece_110_robot.png
ren "ece_110_group*"             ece_110_group.png
ren "chilkotilab*"               chilkotilab_particle_identification.png
ren "bcpap_stand_photo*"         bcpap_stand_photo.png
ren "bcpap_circui*"              bcpap_circuit_schematic.jpg
ren "bcpap_finalP*"              bcpap_finalPresentationEGR101.pdf
ren "windturbine_teampic*"       windturbine_teampic.png
ren "windturbine_*testing*"      windturbine_tunnel_testing.png
ren "windturbine_poster*"        windturbine_poster.pdf

echo
echo "Done. Contents of images/ now:"
ls -1