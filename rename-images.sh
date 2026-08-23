#!/bin/bash
# Run from inside your portfolio folder:  bash rename-images.sh
# Renames everything in images/ to the exact lowercase names index.html expects.
# Safe to run twice. Lowercase matters — GitHub Pages is case-sensitive even
# though macOS is not, so IMG.JPG vs img.jpg will break only after you deploy.

[ -d images ] || { echo "No images/ folder here. cd to your portfolio folder first."; exit 1; }
mkdir -p docs

# move any PDFs sitting in images/ into docs/
for f in images/*.pdf images/*.PDF; do
  [ -e "$f" ] || continue
  mv -n "$f" docs/ && echo "  moved    $f -> docs/"
done

cd images

ren() {
  for f in $1; do
    [ -e "$f" ] || continue
    [ "$f" = "$2" ] && { echo "  ok       $2"; return; }
    mv -n "$f" "$2" && echo "  renamed  $f -> $2"
    return
  done
  echo "  MISSING  nothing matched '$1'   (expected $2)"
}

echo "Projects and experience"
ren "nasa_ames*"               nasa_ames_voxel_assembly.jpg
ren "sig_thrust_stand_wiring*" sig_thrust_stand_wiring.png
ren "sig_screwsorter*"         sig_screwsorter_iterations.png
ren "sig_toolholder*"          sig_toolholder_cad.png
ren "sig_electroni*"           sig_electronics_enclosure_cad.png
ren "sig_pcb_modeling*"        sig_pcb_modeling_cad.png
ren "lumius_imag*"             lumius_imaging_design_ideas.jpg
ren "lumiusimagi*"             lumiusimaging_probedesign.png
ren "cpu_main*"                cpu_main.png
ren "cpu_control_unit*"        cpu_control_unit.png
ren "cpu_register_file*"       cpu_register_file.png
ren "cpu_program_counter*"     cpu_program_counter.png
ren "cpu_single_register*"     cpu_single_register.png
ren "ece_110_robot*"           ece_110_robot.png
ren "ece_110_group*"           ece_110_group.png
ren "chilkotilab*"             chilkotilab_particle_identification.png
ren "bcpap_stand_photo*"       bcpap_stand_photo.png
ren "bcpap_circui*"            bcpap_circuit_schematic.jpg
ren "windturbine_teampic*"     windturbine_teampic.png
ren "windturbine_*testing*"    windturbine_tunnel_testing.png

echo
echo "Extracurriculars"
ren "oxford_class*"            oxford_class.jpg
ren "180dc*"                   180dc_duke_fall_class.png
ren "catalyst_family*"         catalyst_family.png
ren "catalyst_friends*"        catalyst_friends.jpg
ren "swe_conference*"          swe_conference.jpg
ren "duke_soccer_pic1*"        duke_soccer_1.jpg
ren "duke_soccer_pic2*"        duke_soccer_2.jpg

echo
echo "Documents"
cd ../docs || exit 1
ren "bcpap_final*"       bcpap_finalPresentationEGR101.pdf
ren "windturbine_poster*" windturbine_poster.pdf
ren "JanieQing2026*"     JanieQing20260823.pdf
ren "*esume*.pdf"        JanieQing20260823.pdf

echo
echo "images/ contains:"
ls -1 ../images
echo
echo "docs/ contains:"
ls -1
