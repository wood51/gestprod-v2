<?php

class BlController
{

    /**
     * @route("GET /test/bl/@bl_num")
     */
    public function test_bl_dompdf($f3, $params)
    {
        $blNum = $params['bl_num'];
        $data = [];

        $blMapper = new \DB\Cortex($f3->DB, "prod_essais_planning");
        $data = $blMapper->afind(['num_bl=?', $blNum]);
        $date_bl = $data[0]['date_livraison'];
        $cleanDate = preg_replace('/[^\d\-]/', '-', $date_bl); // remplace tout sauf chiffres et tirets
        $filename = "BL_" . preg_replace('/\s+/', '_', $blNum) . "_" . $cleanDate . ".pdf";
        
        $allEmpty = array_reduce($data, function ($carry, $row) {
            return $carry && empty($row['num_rotor']) && empty($row['num_stator']);
        }, true);

        $nb_lignes_totales = 18;
        $nb_lignes_manquantes = max(0, $nb_lignes_totales - count($data));

        $f3->set('data', $data);
        $f3->set('repeat_fill', range(1, $nb_lignes_manquantes));
        $f3->set('num_bl', $blNum);
        $f3->set('date_bl', $date_bl);
        $f3->set('client', [
            'nom' => 'GUINAULT SA',
            'adresse' => "95 rue du rond d'eau, 45590 Saint-Cyr-en-Val, France",
            'contact' => '',
        ]);
        $f3->set('observations', 'Transport à la charge du client');
        $typeBl = ($allEmpty) ? 'autre' : 'alternateur';
        $html = Template::instance()->render("bl/bl_$typeBl.html");
        Blservice::ouputPdf($html, $filename, true);
    }
}


class BlService
{
    private static function generatePdf($html)
    {
        $f3 = \Base::instance();
        $options = new \Dompdf\Options();
        $options->set('isRemoteEnabled', true);
        $options->set('fontDir', $f3->TEMP);
        $dompdf = new \Dompdf\Dompdf($options);

        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');

        $dompdf->render();

        return $dompdf;
    }

    private static function generatePagination($dompdf, $xPagination, $yPagination)
    {
        // Ajout pagination automatique via canvas
        $canvas = $dompdf->getCanvas();
        $fontMetrics = $dompdf->getFontMetrics();
        $font = $fontMetrics->getFont('Helvetica', 'normal');

        $canvas->page_script(function ($pageNumber, $pageCount, $canvas) use ($font, $xPagination, $yPagination) {
            $text = "Page $pageNumber / $pageCount";
            // double ecriture on efface en blanc plus ecriture noir -> BUG dompdf/CSS tr:nth-child(even/odd)
            $canvas->text($xPagination, $yPagination, $text, $font, 10, [255, 255, 255]);
            $canvas->text($xPagination, $yPagination, $text, $font, 10, [0, 0, 0]);
        });
    }

    public static function ouputPdf($html, $filename, $InBrowser = true, $pagination = true, $xPagination = 520, $yPagination = 810)
    {
        $dompdf = Self::generatePdf($html);
        if ($pagination) {
            self::generatePagination($dompdf, $xPagination, $yPagination);
        }
        $dompdf->stream($filename, ["Attachment" => !$InBrowser]);
    }
}
