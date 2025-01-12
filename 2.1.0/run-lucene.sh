#!/bin/bash
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

if [ "$COUCHDB_USER" ] && [ "$COUCHDB_PASSWORD" ] && [ "$COUCHDB_URL" ]; then
  sed -e "s/http:\/\/\([^@]\+@\)*couchdb:5984/http:\/\/$COUCHDB_USER:$COUCHDB_PASSWORD@$COUCHDB_URL:5984/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
  sed -e "s/https:\/\/\([^@]\+@\)*couchdb:5984/https:\/\/$COUCHDB_USER:$COUCHDB_PASSWORD@$COUCHDB_URL:5984/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
elif [ "$COUCHDB_USER" ] && [ "$COUCHDB_PASSWORD" ]; then
  sed -e "s/http:\/\/\([^@]\+@\)*couchdb:5984/http:\/\/$COUCHDB_USER:$COUCHDB_PASSWORD@couchdb:5984/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
  sed -e "s/https:\/\/\([^@]\+@\)*couchdb:5984/https:\/\/$COUCHDB_USER:$COUCHDB_PASSWORD@couchdb:5984/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
elif [ "$COUCHDB_URL" ]; then
  sed -e "s/http:\/\/\([^@]\+@\)*couchdb:5984/http:\/\/$COUCHDB_URL/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
  sed -e "s/https:\/\/\([^@]\+@\)*couchdb:5984/https:\/\/$COUCHDB_URL/" -i /opt/couchdb-lucene/conf/couchdb-lucene.ini
fi

chown -R couchdb:couchdb /opt/couchdb-lucene
exec gosu couchdb ./bin/run
