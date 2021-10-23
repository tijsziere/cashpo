<?php

namespace Espo\Custom\Services;

use Espo\ORM\Entity;

class Contact extends \Espo\Modules\Crm\Services\Contact
{
    protected $checkForDuplicatesInUpdate = true; // set true to enable for update

    // copied original method
       protected function getDuplicateWhereClause(Entity $entity, $data)
    {
        $whereClause = [
            'OR' => []
        ];

        $toCheck = false;

        if (
			($entity->get('idNumber'))
			&&
			(
                $entity->isNew() || 
                $entity->isAttributeChanged('idNumber')
            )
		) {
            $toCheck = true;
            $whereClause['OR']['idNumber'] = $entity->get('idNumber');
        }

        if (!$toCheck) return null;

        return $whereClause;
    }
}
