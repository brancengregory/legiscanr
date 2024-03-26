--
-- Database: legiscan_api
--

-- --------------------------------------------------------

--
-- Table structure for table ls_bill
--

CREATE TABLE ls_bill (
  bill_id integer NOT NULL,
  state_id smallint NOT NULL,
  session_id smallint NOT NULL,
  body_id smallint NOT NULL,
  current_body_id smallint NOT NULL,
  bill_type_id smallint NOT NULL,
  bill_number varchar(10) NOT NULL,
  status_id smallint NOT NULL,
  status_date date DEFAULT NULL,
  title text NOT NULL,
  description text NOT NULL,
  pending_committee_id smallint NOT NULL,
  legiscan_url varchar(255) NOT NULL,
  state_url varchar(255) NOT NULL,
  change_hash char(32) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_amendment
--

CREATE TABLE ls_bill_amendment (
  amendment_id integer NOT NULL,
  bill_id integer NOT NULL,
  adopted smallint NOT NULL,
  amendment_body_id smallint NOT NULL,
  amendment_mime_id smallint NOT NULL,
  amendment_date date DEFAULT NULL,
  amendment_title varchar(255) NOT NULL,
  amendment_desc text NOT NULL,
  amendment_size integer NOT NULL DEFAULT 0,
  amendment_hash char(32) DEFAULT NULL,
  local_copy smallint NOT NULL,
  local_fragment varchar(255) DEFAULT NULL,
  legiscan_url varchar(255) NOT NULL,
  state_url varchar(255) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_calendar
--

CREATE TABLE ls_bill_calendar (
  bill_id integer NOT NULL,
  event_hash char(8) NOT NULL,
  event_type_id smallint NOT NULL DEFAULT 0,
  event_date date DEFAULT NULL,
  event_time time DEFAULT NULL,
  event_location varchar(64) NOT NULL,
  event_desc varchar(128) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_history
--

CREATE TABLE ls_bill_history (
  bill_id integer NOT NULL,
  history_step smallint NOT NULL,
  history_major smallint NOT NULL,
  history_body_id smallint NOT NULL,
  history_date date DEFAULT NULL,
  history_action text NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_progress
--

CREATE TABLE ls_bill_progress (
  bill_id integer NOT NULL,
  progress_step smallint NOT NULL,
  progress_date date DEFAULT NULL,
  progress_event_id smallint NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_reason
--

CREATE TABLE ls_bill_reason (
  bill_id integer NOT NULL,
  reason_id smallint NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_referral
--

CREATE TABLE ls_bill_referral (
  bill_id integer NOT NULL,
  referral_step smallint NOT NULL,
  referral_date date DEFAULT NULL,
  committee_id smallint NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_sast
--

CREATE TABLE ls_bill_sast (
  bill_id integer NOT NULL,
  sast_type_id smallint NOT NULL,
  sast_bill_id integer NOT NULL,
  sast_bill_number varchar(10) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_sponsor
--

CREATE TABLE ls_bill_sponsor (
  bill_id integer NOT NULL,
  people_id smallint NOT NULL,
  sponsor_order smallint NOT NULL,
  sponsor_type_id smallint NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_subject
--

CREATE TABLE ls_bill_subject (
  bill_id integer NOT NULL,
  subject_id integer NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_supplement
--

CREATE TABLE ls_bill_supplement (
  supplement_id integer NOT NULL,
  bill_id integer NOT NULL,
  supplement_type_id smallint NOT NULL,
  supplement_mime_id smallint NOT NULL,
  supplement_date date DEFAULT NULL,
  supplement_title varchar(255) NOT NULL,
  supplement_desc text NOT NULL,
  supplement_size integer NOT NULL DEFAULT 0,
  supplement_hash char(32) DEFAULT NULL,
  local_copy smallint NOT NULL,
  local_fragment varchar(255) DEFAULT NULL,
  legiscan_url varchar(255) NOT NULL,
  state_url varchar(255) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_text
--

CREATE TABLE ls_bill_text (
  text_id integer NOT NULL,
  bill_id integer NOT NULL,
  bill_text_type_id smallint NOT NULL,
  bill_text_mime_id smallint NOT NULL,
  bill_text_date date DEFAULT NULL,
  bill_text_size integer NOT NULL DEFAULT 0,
  bill_text_hash char(32) DEFAULT NULL,
  local_copy smallint NOT NULL,
  local_fragment varchar(255) DEFAULT NULL,
  legiscan_url varchar(255) NOT NULL,
  state_url varchar(255) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_vote
--

CREATE TABLE ls_bill_vote (
  roll_call_id integer NOT NULL,
  bill_id integer NOT NULL,
  roll_call_body_id smallint NOT NULL,
  roll_call_date date DEFAULT NULL,
  roll_call_desc varchar(255) NOT NULL,
  yea smallint NOT NULL DEFAULT 0,
  nay smallint NOT NULL DEFAULT 0,
  nv smallint NOT NULL DEFAULT 0,
  absent smallint NOT NULL DEFAULT 0,
  total smallint NOT NULL DEFAULT 0,
  passed smallint NOT NULL DEFAULT 0,
  legiscan_url varchar(255) NOT NULL,
  state_url varchar(255) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_bill_vote_detail
--

CREATE TABLE ls_bill_vote_detail (
  roll_call_id integer NOT NULL,
  people_id smallint NOT NULL,
  vote_id smallint NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table ls_body
--

CREATE TABLE ls_body (
  body_id smallint NOT NULL,
  state_id smallint NOT NULL,
  role_id smallint NOT NULL,
  body_abbr char(1) NOT NULL,
  body_short varchar(16) DEFAULT NULL,
  body_name varchar(128) NOT NULL,
  body_role_abbr varchar(3) DEFAULT NULL,
  body_role_name varchar(15) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_committee
--

CREATE TABLE ls_committee (
  committee_id smallint NOT NULL,
  committee_body_id smallint NOT NULL,
  committee_name varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_event_type
--

CREATE TABLE ls_event_type (
  event_type_id smallint NOT NULL,
  event_type_desc varchar(32) NOT NULL
);


--
-- Table structure for table ls_ignore
--

CREATE TABLE ls_ignore (
  bill_id integer NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_mime_type
--

CREATE TABLE ls_mime_type (
  mime_id smallint NOT NULL,
  mime_type varchar(80) NOT NULL,
  mime_ext varchar(4) NOT NULL,
  is_binary smallint NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table ls_monitor
--

CREATE TABLE ls_monitor (
  bill_id integer NOT NULL,
  stance smallint NOT NULL DEFAULT 0,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_party
--

CREATE TABLE ls_party (
  party_id smallint NOT NULL,
  party_abbr char(1) NOT NULL,
  party_short char(3) NOT NULL,
  party_name varchar(32) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_people
--

CREATE TABLE ls_people (
  people_id smallint NOT NULL,
  state_id smallint NOT NULL,
  role_id smallint NOT NULL,
  party_id smallint NOT NULL DEFAULT 0,
  name varchar(128) NOT NULL,
  first_name varchar(32) NOT NULL,
  middle_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  suffix varchar(32) NOT NULL,
  nickname varchar(32) NOT NULL,
  district varchar(9) DEFAULT '',
  committee_sponsor_id smallint NOT NULL DEFAULT 0,
  ballotpedia varchar(64) DEFAULT NULL,
  followthemoney_eid bigint NOT NULL DEFAULT 0,
  votesmart_id integer NOT NULL DEFAULT 0,
  knowwho_pid integer NOT NULL DEFAULT 0,
  opensecrets_id char(9) DEFAULT NULL,
  person_hash char(8) NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_progress
--

CREATE TABLE ls_progress (
  progress_event_id smallint NOT NULL,
  progress_desc varchar(24) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_reason
--

CREATE TABLE ls_reason (
  reason_id smallint NOT NULL,
  reason_desc varchar(32) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_role
--

CREATE TABLE ls_role (
  role_id smallint NOT NULL,
  role_name varchar(64) NOT NULL,
  role_abbr char(3) NOT NULL
);


-- --------------------------------------------------------

--
-- Table structure for table ls_sast_type
--

CREATE TABLE ls_sast_type (
  sast_id smallint NOT NULL,
  sast_description varchar(32) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_session
--

CREATE TABLE ls_session (
  session_id smallint NOT NULL,
  state_id smallint NOT NULL,
  year_start smallint NOT NULL,
  year_end smallint NOT NULL,
  prefile smallint NOT NULL DEFAULT 0,
  sine_die smallint NOT NULL DEFAULT 0,
  prior smallint NOT NULL DEFAULT 0,
  special smallint NOT NULL,
  session_name varchar(64) NOT NULL,
  session_title varchar(64) NOT NULL,
  session_tag varchar(32) NOT NULL,
  import_date date NULL,
  import_hash char(32) NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_signal
--

CREATE TABLE ls_signal (
  object_type varchar(10) NOT NULL,
  object_id integer NOT NULL,
  processed smallint NOT NULL,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table ls_sponsor_type
--

CREATE TABLE ls_sponsor_type (
  sponsor_type_id smallint NOT NULL,
  sponsor_type_desc varchar(24) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_stance
--

CREATE TABLE ls_stance (
  stance smallint NOT NULL,
  stance_desc varchar(24) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_state
--

CREATE TABLE ls_state (
  state_id smallint NOT NULL,
  state_abbr char(2) NOT NULL,
  state_name varchar(64) NOT NULL,
  biennium smallint NOT NULL DEFAULT 0,
  carry_over char(2) DEFAULT NULL,
  capitol varchar(16) NOT NULL,
  latitude decimal(9,6) DEFAULT NULL,
  longitude decimal(9,6) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_subject
--

CREATE TABLE ls_subject (
  subject_id integer NOT NULL,
  state_id smallint NOT NULL,
  subject_name varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_supplement_type
--

CREATE TABLE ls_supplement_type (
  supplement_type_id smallint NOT NULL,
  supplement_type_desc varchar(64) NOT NULL
);


-- --------------------------------------------------------

--
-- Table structure for table ls_text_type
--

CREATE TABLE ls_text_type (
  bill_text_type_id smallint NOT NULL,
  bill_text_name varchar(64) NOT NULL,
  bill_text_sort smallint NOT NULL DEFAULT 0,
  bill_text_supplement smallint NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table ls_type
--

CREATE TABLE ls_type (
  bill_type_id smallint NOT NULL,
  bill_type_name varchar(64) NOT NULL,
  bill_type_abbr varchar(4) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_variable
--

CREATE TABLE ls_variable (
  name varchar(64) NOT NULL,
  value text NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ls_vote
--

CREATE TABLE ls_vote (
  vote_id smallint NOT NULL,
  vote_desc varchar(24) NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table ls_bill
--
ALTER TABLE ls_bill ADD PRIMARY KEY (bill_id);
CREATE INDEX ls_bill_state_id_idx ON ls_bill (state_id);
CREATE INDEX ls_bill_session_id_idx ON ls_bill (session_id);
CREATE INDEX ls_bill_bill_number_idx ON ls_bill (bill_number);

--
-- Indexes for table ls_bill_amendment
--
ALTER TABLE ls_bill_amendment ADD PRIMARY KEY (amendment_id);
CREATE INDEX ls_bill_amendment_bill_id_idx ON ls_bill_amendment (bill_id);

--
-- Indexes for table ls_bill_calendar
--
ALTER TABLE ls_bill_calendar ADD PRIMARY KEY (bill_id,event_hash);

--
-- Indexes for table ls_bill_history
--
ALTER TABLE ls_bill_history ADD PRIMARY KEY (bill_id,history_step);

--
-- Indexes for table ls_bill_progress
--
ALTER TABLE ls_bill_progress ADD PRIMARY KEY (bill_id,progress_step);

--
-- Indexes for table ls_bill_reason
--
CREATE INDEX ls_bill_reason_bill_id_idx ON ls_bill_reason (bill_id);

--
-- Indexes for table ls_bill_referral
--
ALTER TABLE ls_bill_referral ADD PRIMARY KEY (bill_id,referral_step);

--
-- Indexes for table ls_bill_sast
--
ALTER TABLE ls_bill_sast ADD PRIMARY KEY (bill_id,sast_type_id,sast_bill_id);

--
-- Indexes for table ls_bill_sponsor
--
ALTER TABLE ls_bill_sponsor ADD PRIMARY KEY (bill_id,people_id);

--
-- Indexes for table ls_bill_subject
--
ALTER TABLE ls_bill_subject ADD PRIMARY KEY (bill_id,subject_id);

--
-- Indexes for table ls_bill_supplement
--
ALTER TABLE ls_bill_supplement ADD PRIMARY KEY (supplement_id);
CREATE INDEX ls_bill_supplement_bill_id_idx ON ls_bill_supplement (bill_id);

--
-- Indexes for table ls_bill_text
--
ALTER TABLE ls_bill_text ADD PRIMARY KEY (text_id);
CREATE INDEX ls_bill_text_bill_id_idx ON ls_bill_text (bill_id);

--
-- Indexes for table ls_bill_vote
--
ALTER TABLE ls_bill_vote ADD PRIMARY KEY (roll_call_id);
CREATE INDEX ls_bill_text_bill_id_idx ON ls_bill_vote (bill_id);

--
-- Indexes for table ls_bill_vote_detail
--
ALTER TABLE ls_bill_vote_detail ADD PRIMARY KEY (roll_call_id,people_id);

--
-- Indexes for table ls_body
--
ALTER TABLE ls_body ADD PRIMARY KEY (body_id);
CREATE INDEX ls_body_state_id_idx ON ls_body (state_id);
CREATE INDEX ls_body_role_id_idx ON ls_body (role_id);
CREATE INDEX ls_body_body_abbr_idx ON ls_body (body_abbr);

--
-- Indexes for table ls_committee
--
ALTER TABLE ls_committee ADD PRIMARY KEY (committee_id);
CREATE INDEX ls_committee_committee_body_id_idx ON ls_committee (committee_body_id);

--
-- Indexes for table ls_event_type
--
ALTER TABLE ls_event_type ADD PRIMARY KEY (event_type_id);

--
-- Indexes for table ls_ignore
--
ALTER TABLE ls_ignore ADD PRIMARY KEY (bill_id);

--
-- Indexes for table ls_mime_type
--
ALTER TABLE ls_mime_type ADD PRIMARY KEY (mime_id);

--
-- Indexes for table ls_monitor
--
ALTER TABLE ls_monitor ADD PRIMARY KEY (bill_id);

--
-- Indexes for table ls_party
--
ALTER TABLE ls_party ADD PRIMARY KEY (party_id);

--
-- Indexes for table ls_people
--
ALTER TABLE ls_people ADD PRIMARY KEY (people_id);
CREATE INDEX ls_people_state_id_idx ON ls_people (state_id);
CREATE INDEX ls_people_role_id_idx ON ls_people (role_id);
CREATE INDEX ls_people_party_id_idx ON ls_people (party_id);

--
-- Indexes for table ls_progress
--
ALTER TABLE ls_progress ADD PRIMARY KEY (progress_event_id);

--
-- Indexes for table ls_reason
--
ALTER TABLE ls_reason ADD PRIMARY KEY (reason_id);

--
-- Indexes for table ls_role
--
ALTER TABLE ls_role ADD PRIMARY KEY (role_id);

--
-- Indexes for table ls_sast_type
--
ALTER TABLE ls_sast_type ADD PRIMARY KEY (sast_id);

--
-- Indexes for table ls_session
--
ALTER TABLE ls_session ADD PRIMARY KEY (session_id);

--
-- Indexes for table ls_signal
--
ALTER TABLE ls_signal ADD PRIMARY KEY (object_type,object_id);

--
-- Indexes for table ls_sponsor_type
--
ALTER TABLE ls_sponsor_type ADD PRIMARY KEY (sponsor_type_id);

--
-- Indexes for table ls_stance
--
ALTER TABLE ls_stance ADD PRIMARY KEY (stance);

--
-- Indexes for table ls_state
--
ALTER TABLE ls_state ADD PRIMARY KEY (state_id);
CREATE INDEX ls_state_state_abbr_idx ON ls_state (state_abbr);

--
-- Indexes for table ls_subject
--
ALTER TABLE ls_subject ADD PRIMARY KEY (subject_id);
CREATE INDEX ls_subject_state_id_idx ON ls_subject (state_id);

--
-- Indexes for table ls_supplement_type
--
ALTER TABLE ls_supplement_type ADD PRIMARY KEY (supplement_type_id);

--
-- Indexes for table ls_text_type
--
ALTER TABLE ls_text_type ADD PRIMARY KEY (bill_text_type_id);

--
-- Indexes for table ls_type
--
ALTER TABLE ls_type ADD PRIMARY KEY (bill_type_id);

--
-- Indexes for table ls_variable
--
ALTER TABLE ls_variable ADD PRIMARY KEY (name);

--
-- Indexes for table ls_vote
--
ALTER TABLE ls_vote ADD PRIMARY KEY (vote_id);


-- --------------------------------------------------------

--
-- Inserting data for table ls_body
--

INSERT INTO ls_body (body_id, state_id, role_id, body_abbr, body_short, body_name, body_role_abbr, body_role_name) VALUES
(1, 48, 1, 'H', 'House', 'House of Delegates', 'Del', 'Delegate'),
(2, 48, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(3, 38, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(4, 38, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(5, 35, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(6, 35, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(7, 46, 1, 'H', 'House', 'House of Delegates', 'Del', 'Delegate'),
(8, 46, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(11, 1, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(12, 1, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(13, 2, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(14, 2, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(15, 3, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(16, 3, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(17, 4, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(18, 4, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(19, 5, 1, 'A', 'Assembly', 'State Assembly', 'Asm', 'Assemblymember'),
(20, 5, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(21, 6, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(22, 6, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(23, 7, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(24, 7, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(25, 8, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(26, 8, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(27, 9, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(28, 9, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(29, 10, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(30, 10, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(31, 11, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(32, 11, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(33, 12, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(34, 12, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(35, 13, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(36, 13, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(37, 14, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(38, 14, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(39, 15, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(40, 15, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(41, 16, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(42, 16, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(43, 17, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(44, 17, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(45, 18, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(46, 18, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(47, 19, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(48, 19, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(49, 20, 1, 'H', 'House', 'House of Delegates', 'Del', 'Delegate'),
(50, 20, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(51, 21, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(52, 21, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(53, 22, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(54, 22, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(55, 23, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(56, 23, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(57, 24, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(58, 24, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(59, 25, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(60, 25, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(61, 26, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(62, 26, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(64, 27, 2, 'L', 'Legislature', 'Legislature', 'Sen', 'Senator'),
(65, 28, 1, 'A', 'Assembly', 'Assembly', 'Rep', 'Representative'),
(66, 28, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(67, 29, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(68, 29, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(69, 30, 1, 'A', 'Assembly', 'General Assembly', 'Rep', 'Representative'),
(70, 30, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(71, 31, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(72, 31, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(73, 32, 1, 'A', 'Assembly', 'Assembly', 'Asm', 'Assemblymember'),
(74, 32, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(75, 33, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(76, 33, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(77, 34, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(78, 34, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(79, 36, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(80, 36, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(81, 37, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(82, 37, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(83, 39, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(84, 39, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(85, 40, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(86, 40, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(87, 41, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(88, 41, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(89, 42, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(90, 42, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(91, 43, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(92, 43, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(93, 44, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(94, 44, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(95, 45, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(96, 45, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(97, 47, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(98, 47, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(99, 49, 1, 'A', 'House', 'State Assembly', 'Rep', 'Representative'),
(100, 49, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(101, 50, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(102, 50, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(103, 21, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(106, 49, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(107, 39, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(108, 7, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(109, 16, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(110, 34, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(111, 4, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(112, 50, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(113, 8, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(114, 52, 1, 'H', 'House', 'House of Representatives', 'Rep', 'Representative'),
(115, 52, 2, 'S', 'Senate', 'Senate', 'Sen', 'Senator'),
(116, 51, 2, 'C', 'Council', 'City Council', 'Cnc', 'Councilmember'),
(117, 36, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(118, 37, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(119, 19, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(120, 26, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(121, 42, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(122, 25, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(123, 52, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(124, 6, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(125, 15, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(126, 20, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint'),
(127, 41, 3, 'J', 'Joint', 'Joint Conference', 'Jnt', 'Joint');

-- --------------------------------------------------------

--
-- Inserting data for table ls_event_type
--

INSERT INTO ls_event_type (event_type_id, event_type_desc) VALUES
(1, 'Hearing'),
(2, 'Executive Session'),
(3, 'Markup Session');

-- --------------------------------------------------------

--
-- Inserting data for table ls_mime_type
--

INSERT INTO ls_mime_type (mime_id, mime_type, mime_ext, is_binary) VALUES
(1, 'text/html', 'html', 0),
(2, 'application/pdf', 'pdf', 1),
(3, 'application/wordperfect', 'wpd', 1),
(4, 'application/msword', 'doc', 1),
(5, 'application/rtf', 'rtf', 1),
(6, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'docx', 1),
(7, 'application/vnd.ms-excel', 'xls', 1),
(8, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx', 1),
(9, 'text/csv', 'csv', 0),
(10, 'application/json', 'json', 0),
(11, 'application/zip', 'zip', 1);

-- --------------------------------------------------------

--
-- Inserting data for table ls_party
--

INSERT INTO ls_party (party_id, party_abbr, party_short, party_name) VALUES
(1, 'D', 'Dem', 'Democrat'),
(2, 'R', 'Rep', 'Republican'),
(3, 'I', 'Ind', 'Independent'),
(4, 'G', 'Grn', 'Green Party'),
(5, 'L', 'Lib', 'Libertarian'),
(6, 'N', 'NP', 'Nonpartisan');

-- --------------------------------------------------------

--
-- Inserting data for table ls_progress
--

INSERT INTO ls_progress (progress_event_id, progress_desc) VALUES
(0, 'Prefiled'),
(1, 'Introduced'),
(2, 'Engrossed'),
(3, 'Enrolled'),
(4, 'Passed'),
(5, 'Vetoed'),
(6, 'Failed'),
(7, 'Override'),
(8, 'Chaptered'),
(9, 'Refer'),
(10, 'Report Pass'),
(11, 'Report DNP'),
(12, 'Draft');

-- --------------------------------------------------------

--
-- Inserting data for table ls_reason
--

INSERT INTO ls_reason (reason_id, reason_desc) VALUES
(1, 'NewBill'),
(2, 'StatusChange'),
(3, 'Chamber'),
(4, 'Complete'),
(5, 'Title'),
(6, 'Description'),
(7, 'CommRefer'),
(8, 'CommReport'),
(9, 'SponsorAdd'),
(10, 'SponsorRemove'),
(11, 'SponsorChange'),
(12, 'HistoryAdd'),
(13, 'HistoryRemove'),
(14, 'HistoryRevised'),
(15, 'HistoryMajor'),
(16, 'HistoryMinor'),
(17, 'SubjectAdd'),
(18, 'SubjectRemove'),
(19, 'SAST'),
(20, 'Text'),
(21, 'Amendment'),
(22, 'Supplement'),
(23, 'Vote'),
(24, 'Calendar'),
(25, 'Progress'),
(26, 'VoteUpdate'),
(27, 'TextUpdate'),
(99, 'ICBM');

-- --------------------------------------------------------

--
-- Inserting data for table ls_role
--

INSERT INTO ls_role (role_id, role_name, role_abbr) VALUES
(1, 'Representative', 'Rep'),
(2, 'Senator', 'Sen'),
(3, 'Joint Conference', 'Jnt');

-- --------------------------------------------------------

--
-- Inserting data for table ls_sast_type
--

INSERT INTO ls_sast_type (sast_id, sast_description) VALUES
(1, 'Same As'),
(2, 'Similar To'),
(3, 'Replaced by'),
(4, 'Replaces'),
(5, 'Crossfiled'),
(6, 'Enabling for'),
(7, 'Enabled by'),
(8, 'Related'),
(9, 'Carry Over');

-- --------------------------------------------------------

--
-- Inserting data for table ls_sponsor_type
--

INSERT INTO ls_sponsor_type (sponsor_type_id, sponsor_type_desc) VALUES
(0, 'Sponsor'),
(1, 'Primary Sponsor'),
(2, 'Co-Sponsor'),
(3, 'Joint Sponsor');

-- --------------------------------------------------------

--
-- Inserting data for table ls_stance
--

INSERT INTO ls_stance (stance, stance_desc) VALUES
(0, 'Watch'),
(1, 'Support'),
(2, 'Oppose');

-- --------------------------------------------------------

--
-- Inserting data for table ls_state
--

INSERT INTO ls_state (state_id, state_abbr, state_name, biennium, carry_over, capitol, latitude, longitude) VALUES
(1, 'AL', 'Alabama', 0, 'NO', 'Montgomery', '32.377716', '-86.300489'),
(2, 'AK', 'Alaska', 1, 'OE', 'Juneau', '58.301105', '-134.412957'),
(3, 'AZ', 'Arizona', 0, 'NO', 'Phoenix', '33.448113', '-112.097037'),
(4, 'AR', 'Arkansas', 0, 'NO', 'Little Rock', '34.746361', '-92.289422'),
(5, 'CA', 'California', 1, 'OE', 'Sacramento', '38.576700', '-121.493766'),
(6, 'CO', 'Colorado', 0, 'NO', 'Denver', '39.739276', '-104.984848'),
(7, 'CT', 'Connecticut', 0, 'NO', 'Hartford', '41.762831', '-72.682383'),
(8, 'DE', 'Delaware', 1, 'OE', 'Dover', '39.157354', '-75.519570'),
(9, 'FL', 'Florida', 0, 'NO', 'Tallahassee', '30.438086', '-84.282196'),
(10, 'GA', 'Georgia', 1, 'OE', 'Atlanta', '33.749035', '-84.388195'),
(11, 'HI', 'Hawaii', 0, 'OE', 'Honolulu', '21.294786', '-157.858818'),
(12, 'ID', 'Idaho', 0, 'NO', 'Boise', '43.617850', '-116.199940'),
(13, 'IL', 'Illinois', 1, 'OE', 'Springfield', '39.798358', '-89.654972'),
(14, 'IN', 'Indiana', 0, 'NO', 'Indianapolis', '39.768590', '-86.162634'),
(15, 'IA', 'Iowa', 1, 'OE', 'Des Moines', '41.591183', '-93.603694'),
(16, 'KS', 'Kansas', 1, 'OE', 'Topeka', '39.048070', '-95.678080'),
(17, 'KY', 'Kentucky', 0, 'NO', 'Frankfort', '38.186658', '-84.875265'),
(18, 'LA', 'Louisiana', 0, 'NO', 'Baton Rouge', '30.456615', '-91.187356'),
(19, 'ME', 'Maine', 1, 'OE', 'Augusta', '44.307185', '-69.781390'),
(20, 'MD', 'Maryland', 0, 'NO', 'Annapolis', '38.978862', '-76.490685'),
(21, 'MA', 'Massachusetts', 1, 'OE', 'Boston', '42.358424', '-71.063701'),
(22, 'MI', 'Michigan', 1, 'OE', 'Lansing', '42.733470', '-84.555300'),
(23, 'MN', 'Minnesota', 1, 'OE', 'Saint Paul', '44.948232', '-93.105406'),
(24, 'MS', 'Mississippi', 0, 'NO', 'Jackson', '32.303799', '-90.182005'),
(25, 'MO', 'Missouri', 0, 'NO', 'Jefferson City', '38.579206', '-92.173019'),
(26, 'MT', 'Montana', 0, 'NO', 'Helena', '46.585774', '-112.018180'),
(27, 'NE', 'Nebraska', 1, 'OE', 'Lincoln', '40.807935', '-96.699655'),
(28, 'NV', 'Nevada', 0, 'NO', 'Carson City', '39.164009', '-119.766153'),
(29, 'NH', 'New Hampshire', 0, 'OE', 'Concord', '43.206854', '-71.537659'),
(30, 'NJ', 'New Jersey', 1, 'EO', 'Trenton', '40.220280', '-74.770140'),
(31, 'NM', 'New Mexico', 0, 'NO', 'Santa Fe', '35.682440', '-105.940074'),
(32, 'NY', 'New York', 1, 'OE', 'Albany', '40.771120', '-73.974190'),
(33, 'NC', 'North Carolina', 1, 'OE', 'Raleigh', '35.780498', '-78.639110'),
(34, 'ND', 'North Dakota', 1, 'NO', 'Bismarck', '46.820900', '-100.781955'),
(35, 'OH', 'Ohio', 1, 'OE', 'Columbus', '39.961392', '-82.999065'),
(36, 'OK', 'Oklahoma', 0, 'OE', 'Oklahoma City', '35.492320', '-97.503340'),
(37, 'OR', 'Oregon', 0, 'NO', 'Salem', '44.938361', '-123.030155'),
(38, 'PA', 'Pennsylvania', 1, 'OE', 'Harrisburg', '40.264330', '-76.883521'),
(39, 'RI', 'Rhode Island', 0, 'OE', 'Providence', '41.831097', '-71.414883'),
(40, 'SC', 'South Carolina', 1, 'OE', 'Columbia', '34.000386', '-81.033210'),
(41, 'SD', 'South Dakota', 0, 'NO', 'Pierre', '44.367630', '-100.346040'),
(42, 'TN', 'Tennessee', 1, 'OE', 'Nashville', '36.166011', '-86.784297'),
(43, 'TX', 'Texas', 1, 'NO', 'Austin', '30.274001', '-97.740631'),
(44, 'UT', 'Utah', 0, 'NO', 'Salt Lake City', '40.777200', '-111.888280'),
(45, 'VT', 'Vermont', 1, 'OE', 'Montpelier', '44.262141', '-72.580716'),
(46, 'VA', 'Virginia', 0, 'EO', 'Richmond', '37.538783', '-77.433449'),
(47, 'WA', 'Washington', 1, 'OE', 'Olympia', '47.035964', '-122.904799'),
(48, 'WV', 'West Virginia', 0, 'OE', 'Charleston', '38.336166', '-81.612186'),
(49, 'WI', 'Wisconsin', 1, 'OE', 'Madison', '43.074530', '-89.384120'),
(50, 'WY', 'Wyoming', 0, 'NO', 'Cheyenne', '41.140101', '-104.820112'),
(51, 'DC', 'Washington D.C.', 1, 'OE', 'Washington, DC', '38.894825', '-77.031338'),
(52, 'US', 'US Congress', 1, 'OE', 'Washington, DC', '38.889873', '-77.008823');

-- --------------------------------------------------------

--
-- Inserting data for table ls_supplement_type
--

INSERT INTO ls_supplement_type (supplement_type_id, supplement_type_desc) VALUES
(1, 'Fiscal Note'),
(2, 'Analysis'),
(3, 'Fiscal Note/Analysis'),
(4, 'Vote Image'),
(5, 'Local Mandate'),
(6, 'Corrections Impact'),
(7, 'Misc'),
(8, 'Veto Letter');

-- --------------------------------------------------------

--
-- Inserting data for table ls_text_type
--

INSERT INTO ls_text_type (bill_text_type_id, bill_text_name, bill_text_sort, bill_text_supplement) VALUES
(1, 'Introduced', 2, 0),
(2, 'Comm Sub', 4, 0),
(3, 'Amended', 3, 0),
(4, 'Engrossed', 7, 0),
(5, 'Enrolled', 8, 0),
(6, 'Chaptered', 9, 0),
(7, 'Fiscal Note', 0, 1),
(8, 'Analysis', 0, 1),
(9, 'Draft', 1, 0),
(10, 'Conference Sub', 5, 0),
(11, 'Prefiled', 0, 0),
(12, 'Veto Message', 0, 1),
(13, 'Veto Response', 0, 1),
(14, 'Substitute', 6, 0);

-- --------------------------------------------------------

--
-- Inserting data for table ls_type
--

INSERT INTO ls_type (bill_type_id, bill_type_name, bill_type_abbr) VALUES
(1, 'Bill', 'B'),
(2, 'Resolution', 'R'),
(3, 'Concurrent Resolution', 'CR'),
(4, 'Joint Resolution', 'JR'),
(5, 'Joint Resolution Constitutional Amendment', 'JRCA'),
(6, 'Executive Order', 'EO'),
(7, 'Constitutional Amendment', 'CA'),
(8, 'Memorial', 'M'),
(9, 'Claim', 'CL'),
(10, 'Commendation', 'C'),
(11, 'Committee Study Request', 'CSR'),
(12, 'Joint Memorial', 'JM'),
(13, 'Proclamation', 'P'),
(14, 'Study Request', 'SR'),
(15, 'Address', 'A'),
(16, 'Concurrent Memorial', 'CM'),
(17, 'Initiative', 'I'),
(18, 'Petition', 'PET'),
(19, 'Study Bill', 'SB'),
(20, 'Initiative Petition', 'IP'),
(21, 'Repeal Bill', 'RB'),
(22, 'Remonstration', 'RM'),
(23, 'Committee Bill', 'CB');

-- --------------------------------------------------------

--
-- Inserting data for table ls_vote
--

INSERT INTO ls_variable (name, value) VALUES
('schema', '9'),
('version', '"1.4.0"');

-- --------------------------------------------------------

--
-- Inserting data for table ls_vote
--

INSERT INTO ls_vote (vote_id, vote_desc) VALUES
(1, 'Yea'),
(2, 'Nay'),
(3, 'Not Voting'),
(4, 'Absent');

-- --------------------------------------------------------

--
-- Creating view for lsv_bill
--

CREATE VIEW lsv_bill AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  b.status_id,
  p.progress_desc AS status_desc,
  b.status_date,
  b.title,
  b.description,
  b.bill_type_id,
  t.bill_type_name,
  t.bill_type_abbr,
  b.body_id,
  bo1.body_abbr,
  bo1.body_short,
  bo1.body_name,
  b.current_body_id,
  bo2.body_abbr AS current_body_abbr,
  bo2.body_short AS current_body_short,
  bo2.body_name AS current_body_name,
  b.pending_committee_id,
  c.committee_body_id AS pending_committee_body_id,
  bo3.body_abbr AS pending_committee_body_abbr,
  bo3.body_short AS pending_committee_body_short,
  bo3.body_name AS pending_committee_body_name,
  c.committee_name AS pending_committee_name,
  b.legiscan_url,
  b.state_url,
  b.change_hash,
  b.created,
  b.updated,
  b.state_id,
  st.state_name,
  b.session_id,
  s.year_start AS session_year_start,
  s.year_end AS session_year_end,
  s.prefile AS session_prefile,
  s.sine_die AS session_sine_die,
  s.prior AS session_prior,
  s.special AS session_special,
  s.session_tag,
  s.session_title,
  s.session_name
FROM
  ls_bill b
  INNER JOIN ls_type t ON b.bill_type_id = t.bill_type_id
  INNER JOIN ls_session s ON b.session_id = s.session_id
  INNER JOIN ls_body bo1 ON b.body_id = bo1.body_id
  INNER JOIN ls_body bo2 ON b.current_body_id = bo2.body_id
  LEFT JOIN ls_committee c ON b.pending_committee_id = c.committee_id
  LEFT JOIN ls_body bo3 ON c.committee_body_id = bo3.body_id
  LEFT JOIN ls_progress p ON b.status_id = p.progress_event_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_amendment
--

CREATE VIEW lsv_bill_amendment AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  ba.amendment_id,
  ba.amendment_date,
  ba.amendment_body_id,
  ba.amendment_size,
  ba.amendment_title,
  ba.amendment_desc,
  ba.adopted,
  ba.amendment_mime_id,
  mt.mime_type,
  mt.mime_ext,
  ba.amendment_hash,
  ba.legiscan_url,
  ba.state_url,
  ba.local_copy,
  ba.local_fragment,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id,
  ba.created,
  ba.updated
FROM
  ls_bill b
  INNER JOIN ls_bill_amendment ba ON b.bill_id = ba.bill_id
  INNER JOIN ls_mime_type mt ON ba.amendment_mime_id = mt.mime_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_calendar
--

CREATE VIEW lsv_bill_calendar AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bc.event_date,
  bc.event_time,
  bc.event_location,
  bc.event_desc,
  bc.event_type_id,
  et.event_type_desc,
  bc.event_hash,
  b.pending_committee_id,
  c.committee_body_id AS pending_committee_body_id,
  bo.body_abbr AS pending_committee_body_abbr,
  bo.body_short AS pending_committee_body_short,
  c.committee_name AS pending_committee_name,
  bc.created,
  bc.updated,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id
FROM
  ls_bill b
  INNER JOIN ls_bill_calendar bc ON b.bill_id = bc.bill_id
  INNER JOIN ls_event_type et ON bc.event_type_id = et.event_type_id
  LEFT JOIN ls_committee c ON b.pending_committee_id = c.committee_id
  LEFT JOIN ls_body bo ON c.committee_body_id = bo.body_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_history
--

CREATE VIEW lsv_bill_history AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bh.history_step,
  bh.history_date,
  bo.body_short AS history_body_short,
  bh.history_action,
  bh.history_body_id,
  bo.body_abbr AS history_body_abbr,
  bo.body_name AS history_body_name,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id
FROM
  ls_bill b
  INNER JOIN ls_bill_history bh ON b.bill_id = bh.bill_id
  LEFT JOIN ls_body bo ON bh.history_body_id = bo.body_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_reason
--

CREATE VIEW lsv_bill_reason AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  br.reason_id,
  r.reason_desc,
  br.created as change_time,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id
FROM
  ls_bill b
  INNER JOIN ls_bill_reason br ON b.bill_id = br.bill_id
  INNER JOIN ls_reason r ON br.reason_id = r.reason_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_referral
--

CREATE VIEW lsv_bill_referral AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  br.referral_step,
  br.referral_date,
  br.committee_id AS referral_committee_id,
  bo1.body_abbr AS referral_committee_body_abbr,
  bo1.body_short AS referral_committee_body_short,
  bo1.body_name AS referral_committee_body_name,
  c1.committee_name AS referral_committee_name,
  b.pending_committee_id,
  bo2.body_abbr AS pending_committee_body_abbr,
  bo2.body_short AS pending_committee_body_short,
  bo2.body_name AS pending_committee_body_name,
  c2.committee_name AS pending_committee_name,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id
FROM
  ls_bill b
  INNER JOIN ls_bill_referral br ON b.bill_id = br.bill_id
  LEFT JOIN ls_committee c1 ON br.committee_id = c1.committee_id
  INNER JOIN ls_body bo1 ON c1.committee_body_id = bo1.body_id
  LEFT JOIN ls_committee c2 ON b.pending_committee_id = c2.committee_id
  LEFT JOIN ls_body bo2 ON c2.committee_body_id = bo2.body_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_sast
--

CREATE VIEW lsv_bill_sast AS
SELECT
  b1.bill_id,
  st1.state_abbr,
  b1.bill_number,
  bs.sast_type_id,
  sty.sast_description,
  b1.state_id,
  b1.session_id,
  b1.body_id,
  b1.current_body_id,
  b1.bill_type_id,
  b1.status_id,
  b1.pending_committee_id,
  bs.sast_bill_id,
  st2.state_abbr AS sast_state_abbr,
  bs.sast_bill_number,
  b2.state_id AS sast_state_id,
  b2.session_id AS sast_session_id,
  b2.body_id AS sast_body_id,
  b2.current_body_id AS sast_current_body_id,
  b2.bill_type_id AS sast_bill_type_id,
  b2.status_id AS sast_status_id,
  b2.pending_committee_id AS sast_pending_committee_id
FROM
  ls_bill b1
  INNER JOIN ls_bill_sast bs ON b1.bill_id = bs.bill_id
  INNER JOIN ls_sast_type sty ON bs.sast_type_id = sty.sast_id
  INNER JOIN ls_state st1 ON b1.state_id = st1.state_id
  LEFT JOIN ls_bill b2 ON bs.sast_bill_id = b2.bill_id
  LEFT JOIN ls_state st2 ON b2.state_id = st2.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_sponsor
--

CREATE VIEW lsv_bill_sponsor AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bs.people_id,
  bs.sponsor_order,
  bs.sponsor_type_id,
  spt.sponsor_type_desc,
  p.party_id,
  pa.party_abbr,
  pa.party_name,
  p.role_id,
  r.role_abbr,
  r.role_name,
  p.name,
  p.first_name,
  p.middle_name,
  p.last_name,
  p.suffix,
  p.nickname,
  p.ballotpedia,
  p.followthemoney_eid,
  p.votesmart_id,
  p.opensecrets_id,
  p.knowwho_pid,
  p.committee_sponsor_id,
  c.committee_body_id AS committee_sponsor_body_id,
  c.committee_name AS committee_sponsor_name,
  p.person_hash,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id
FROM
  ls_bill b
  INNER JOIN ls_bill_sponsor bs ON b.bill_id = bs.bill_id
  INNER JOIN ls_sponsor_type spt ON bs.sponsor_type_id = spt.sponsor_type_id
  INNER JOIN ls_people p ON bs.people_id = p.people_id
  LEFT JOIN ls_committee c ON p.committee_sponsor_id = c.committee_id
  INNER JOIN ls_party pa ON p.party_id = pa.party_id
  INNER JOIN ls_role r ON p.role_id = r.role_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_subject
--

CREATE VIEW lsv_bill_subject AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bs.subject_id,
  s.subject_name,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id
FROM
  ls_bill b
  INNER JOIN ls_bill_subject bs ON b.bill_id = bs.bill_id
  INNER JOIN ls_subject s ON bs.subject_id = s.subject_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_supplement
--

CREATE VIEW lsv_bill_supplement AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bs.supplement_id,
  bs.supplement_date,
  bs.supplement_type_id,
  sut.supplement_type_desc,
  bs.supplement_size,
  bs.supplement_mime_id,
  mt.mime_type,
  mt.mime_ext,
  bs.supplement_hash,
  bs.legiscan_url,
  bs.state_url,
  bs.local_copy,
  bs.local_fragment,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id,
  bs.created,
  bs.updated
FROM
  ls_bill b
  INNER JOIN ls_bill_supplement bs ON b.bill_id = bs.bill_id
  INNER JOIN ls_supplement_type sut ON bs.supplement_type_id = sut.supplement_type_id
  INNER JOIN ls_mime_type mt ON bs.supplement_mime_id = mt.mime_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------
--
-- Creating view for lsv_bill_text
--

CREATE VIEW lsv_bill_text AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bt.text_id,
  bt.bill_text_size,
  bt.bill_text_date,
  bt.bill_text_type_id,
  tt.bill_text_name,
  tt.bill_text_sort,
  bt.bill_text_mime_id,
  mt.mime_type,
  mt.mime_ext,
  bt.bill_text_hash,
  bt.legiscan_url,
  bt.state_url,
  bt.local_copy,
  bt.local_fragment,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id,
  bt.created,
  bt.updated
FROM
  ls_bill b
  INNER JOIN ls_bill_text bt ON b.bill_id = bt.bill_id
  INNER JOIN ls_text_type tt ON bt.bill_text_type_id = tt.bill_text_type_id
  INNER JOIN ls_mime_type mt ON bt.bill_text_mime_id = mt.mime_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_vote
--

CREATE VIEW lsv_bill_vote AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bv.roll_call_id,
  bv.roll_call_date,
  bv.roll_call_desc,
  bv.roll_call_body_id,
  bo.body_abbr AS roll_call_body_abbr,
  bo.body_short AS roll_call_body_short,
  bo.body_name AS roll_call_body_name,
  bv.yea,
  bv.nay,
  bv.nv,
  bv.absent,
  bv.total,
  bv.passed,
  bv.legiscan_url,
  bv.state_url,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id,
  bv.created,
  bv.updated
FROM
  ls_bill b
  INNER JOIN ls_bill_vote bv ON b.bill_id = bv.bill_id
  INNER JOIN ls_body bo ON bv.roll_call_body_id = bo.body_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Creating view for lsv_bill_vote_detail
--

CREATE VIEW lsv_bill_vote_detail AS
SELECT
  b.bill_id,
  st.state_abbr,
  b.bill_number,
  bv.roll_call_id,
  bvd.people_id,
  bvd.vote_id,
  v.vote_desc,
  p.party_id,
  pa.party_abbr,
  p.role_id,
  r.role_abbr,
  r.role_name,
  p.name,
  p.first_name,
  p.middle_name,
  p.last_name,
  p.suffix,
  p.nickname,
  p.ballotpedia,
  p.followthemoney_eid,
  p.votesmart_id,
  p.opensecrets_id,
  p.knowwho_pid,
  p.person_hash,
  b.state_id,
  st.state_name,
  b.session_id,
  b.body_id,
  b.current_body_id,
  b.bill_type_id,
  b.status_id,
  b.pending_committee_id
FROM
  ls_bill b
  INNER JOIN ls_bill_vote bv ON b.bill_id = bv.bill_id
  INNER JOIN ls_bill_vote_detail bvd ON bv.roll_call_id = bvd.roll_call_id
  INNER JOIN ls_vote v ON bvd.vote_id = v.vote_id
  INNER JOIN ls_people p ON bvd.people_id = p.people_id
  INNER JOIN ls_party pa ON p.party_id = pa.party_id
  INNER JOIN ls_role r ON p.role_id = r.role_id
  INNER JOIN ls_state st ON b.state_id = st.state_id;

-- --------------------------------------------------------

--
-- Create function for trigger to replicate MySQL ON UPDATE CURRENT_TIMESTAMP
--
CREATE OR REPLACE FUNCTION update_ts_column() RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $$
BEGIN
  NEW.updated := now();
  RETURN NEW;	
END;
$$;

-- --------------------------------------------------------

--
-- Assign update trigger function 
--
CREATE TRIGGER trig_ls_bill_update BEFORE UPDATE ON ls_bill FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_bill_amendment_update BEFORE UPDATE ON ls_bill_amendment FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_bill_calendar_update BEFORE UPDATE ON ls_bill_calendar FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_bill_supplement_update BEFORE UPDATE ON ls_bill_supplement FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_bill_text_update BEFORE UPDATE ON ls_bill_text FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_bill_vote_update BEFORE UPDATE ON ls_bill_vote FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_people_update BEFORE UPDATE ON ls_people FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
CREATE TRIGGER trig_ls_signal_update BEFORE UPDATE ON ls_signal FOR EACH ROW EXECUTE PROCEDURE update_ts_column();
