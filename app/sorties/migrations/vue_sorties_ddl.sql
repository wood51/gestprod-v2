-- `gestprod-v2`.vue_sorties source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vue_sorties` AS
select
    cast(sum(`tse`.`designation` = 'rotor') as unsigned) AS `rotor`,
    cast(sum(`tse`.`designation` = 'stator') as unsigned) AS `stator`,
    cast(sum(`tse`.`designation` = 'stator_st') as unsigned) AS `stator_st`,
    cast(sum(`tse`.`designation` = 'palier') as unsigned) AS `palier`,
    cast(sum(`tse`.`designation` = 'alternateur') as unsigned) AS `alternateur`,
    date_format(`s`.`date_sortie`, '%d/%m/%Y') AS `date`,
    date_format(`s`.`date_sortie`, '%u-%Y') AS `semaine`
from
    (`type_sous_emsemble` `tse`
join `sorties` `s` on
    (`s`.`fk_type_sous_ensemble` = `tse`.`id`));